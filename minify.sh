#!/bin/bash
#
# Script que minifica los archivos .html, .css y .js y los añade a la carpeta "dist".
#
# -----------------------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# -----------------------------------------------------------------------------------

f_exclude_paths() {
    excluded_paths=(
        "*dist*"
        "*node_modules*"
        "./.*"
        "*.sh"
    )

    exclude=()
    for i in "${excluded_paths[@]}"
    do
        exclude+=(-not -path "$i")
    done
}

f_minify() {
    while read -d $'\0' file; do
        rel_path=${file#./}
        min_path="$folder/$rel_path"

        case "$file" in
            *.html)
            html-minifier "$file" -o "$min_path" --collapse-whitespace --remove-comments
            ;;
            *.css)
            cleancss "$file" -o "$min_path" --compatibility "ie >= 11, Edge >= 12, Firefox >= 2, Chrome >= 4, Safari >= 3.1, Opera >= 15, iOS >= 3.2"
            ;;
            *.js)
            uglifyjs "$file" -o "$min_path" --compress drop_console --mangle --mangle-props
            ;;
        esac
    done < <(find . -mindepth 1 "${exclude[@]}" -print0)
}

f_exclude_paths

folder=$1
mkdir $folder

if f_minify; then
    echo
    echo Done!
    echo
fi