# Traffic Interaction Authenticity Slides

Live deck: https://achyutmorang.github.io/smart-pair-slides/

Public-safe research deck for the current thesis direction: Traffic Interaction Authenticity for SMART/CAT-K-style learned multi-agent traffic simulators, with Waymax-backed counterfactual diagnostics.

This repository intentionally excludes checkpoints, processed WOMD files, raw logs, and restricted artifacts.

## Source of truth

The active deck source is the Beamer + Reveal workflow:

- `/beamer-reveal-prototype/slides.tex`
- `/beamer-reveal-prototype/Makefile`

## Local build and preview

```bash
cd beamer-reveal-prototype
make reveal
python3 -m http.server 8765 --directory site
```

Open `http://localhost:8765/index.html`.

## Publish workflow

`docs/` is the static site served by GitHub Pages.

To republish after slide edits:

```bash
cd beamer-reveal-prototype
make reveal
rsync -a --delete site/ ../docs/
touch ../docs/.nojekyll
```
