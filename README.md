# CIFT Slides

Live deck: https://achyutmorang.github.io/smart-pair-slides/

Public-safe Quarto RevealJS research deck for the current CIFT-first thesis direction: counterfactual interaction fine-tuning for SMART/CAT-K-style traffic simulation.

This repository intentionally excludes checkpoints, processed WOMD files, raw logs, and restricted artifacts.

## Local render

```bash
quarto render index.qmd --to revealjs --output-dir docs
```

## GitHub Pages

Serve from the `docs/` directory on the main branch.
