#!/bin/bash
#
# Script que minifica los archivos .html, .css y .js 
# y los añade a la carpeta solicitada por parametros.
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
    output_folder=$1

    while read -d $'\0' file; do
        rel_path=${file#./}
        min_path="$output_folder/$rel_path"  # Include the output folder in the min_path

        # Get the directory path
        min_dir=$(dirname "$min_path")  

        # Create the directory if it doesn't exist
        mkdir -p "$min_dir"

        case "$file" in
            *.html)
            npx html-minifier "$file" -o "$min_path" --collapse-whitespace --remove-comments
            ;;
            *.css)
            npx cleancss "$file" -o "$min_path" --compatibility "ie >= 11, Edge >= 12, Firefox >= 2, Chrome >= 4, Safari >= 3.1, Opera >= 15, iOS >= 3.2"
            ;;
            *.js)
            npx uglifyjs "$file" -o "$min_path" --compress drop_console --mangle --mangle-props
            ;;
        esac
    done < <(find . -mindepth 1 "${exclude[@]}" -print0)
}

f_exclude_paths

if f_minify $1; then
    echo
    echo Done!
    echo
fi