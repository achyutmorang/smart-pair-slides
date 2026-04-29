# Local LaTeX Build

This project is set up to behave like Overleaf locally.

The wrapper script auto-selects:
- `latexmk` + `pdflatex` (if installed), otherwise
- `tectonic` (installed in this environment).

## Main report output

- Source: `main.tex`
- Output PDF: `build/main.pdf`

## Commands

From the project root:

```bash
make build
```

Build once for the main report.

```bash
make watch
```

Watch mode. Rebuilds automatically when `.tex`, `.bib`, or included files change.

```bash
make slides
```

Build `slides/slides.tex` once. Output is `build/slides.pdf`.

```bash
make watch-slides
```

Watch mode for slide deck updates.

## Direct script usage

```bash
./scripts/latex.sh build main.tex
./scripts/latex.sh watch main.tex
./scripts/latex.sh build slides/slides.tex
```

If TeX was installed in a previous terminal session, this script loads
`path_helper` so TeX binaries are found without manual PATH edits.

## Optional full MacTeX path

If you want exact Overleaf parity with `latexmk`, install MacTeX manually in a
local terminal (it prompts for your macOS admin password):

```bash
brew install --cask mactex-no-gui
```
