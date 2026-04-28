# Beamer-Reveal Prototype

This is a controlled-layout alternative to the Quarto RevealJS deck.

## Why this exists

Quarto is convenient, but dense thesis slides are hard to control because generated HTML/CSS can overflow unpredictably. This prototype makes Beamer the source of truth:

```text
slides.tex -> lualatex PDF + slides.rvl -> beamer-reveal.pl -> Reveal.js site
```

## Local one-time converter install

The LaTeX package is already available in TeX Live, but the Perl converter may not be on PATH. A local non-global install works:

```bash
curl -L https://cpanmin.us -o /tmp/cpanm
perl /tmp/cpanm -L /tmp/beamerreveal-perl5 --notest BeamerReveal
```

## Build

```bash
cd beamer-reveal-prototype
make pdf
make reveal
```

Open `site/slides.html` after `make reveal`.

## Design rule

Use Beamer for fixed slide layout, TikZ, equations, and tables. Use `beamer-reveal` only for browser export and media overlays. Do not place Quarto on top of this as the slide layout engine.
