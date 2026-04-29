# Beamer Multi-File Slides Template

This folder borrows the multi-file LaTeX slide structure from:
`Surprise__OOD__and_Scenario_Mining_and_Generation_in_Autonomous_Driving`.

## Structure
- `slides/slides.tex` -> top-level slide entry
- `slides/sections/*.tex` -> section-wise content files
- `preamble.tex` -> shared LaTeX preamble
- `Makefile` + `scripts/latex.sh` -> local build helpers

## Quick start
1. Edit section files in `slides/sections/`.
2. Build from this folder with your preferred TeX toolchain.
