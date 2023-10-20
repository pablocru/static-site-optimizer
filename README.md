# Static Site Optimizer

## Description

The `static-site-optimizer` is a powerful GitHub
Actions workflow designed to optimize static websites. This workflow automates
the process of minifying HTML, CSS, and JavaScript files, reducing their size
and enhancing website loading performance.

## Usage

1. Checkout your repository files

    ```yml
      steps:
        - name: Checkout files
          uses: actions/checkout@<version>
    ```

2. Call the `static-site-optimizer` in your own workflow.

    ```yml
        - name: Minify html, css and js files
          uses: pabcrudel/static-site-optimizer@<version>
    ```

    A project path could be provided. By default, the project path will be the
    `root path`.

    ```yml
          with:
            project_path: website
    ```

3. The minified files will be wrapped inside the `dist` folder in the `root
   path`.

## Contribution

Contributions to this repository are welcomed and encouraged. Whether you
discover a bug, want to propose enhancements, or add new features, please feel
free to open issues and submit pull requests.

Let's optimize the web together! 🚀
