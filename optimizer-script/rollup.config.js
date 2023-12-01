import { terser } from "rollup-plugin-terser";

export default {
  input: "src/index.js", // JS input file
  output: {
    file: "dist/index.js", // JS output file
    name: "StaticSiteOptimizer", // Library name
    plugins: [
      terser() // Rollup minify plugin
    ],
  },
};
