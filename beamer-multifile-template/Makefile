SHELL := /bin/bash
LATEX := ./scripts/latex.sh

MAIN_TEX := main.tex
SLIDES_TEX := slides/slides.tex

.PHONY: build watch slides watch-slides clean clean-slides

build:
	$(LATEX) build $(MAIN_TEX)

watch:
	$(LATEX) watch $(MAIN_TEX)

slides:
	$(LATEX) build $(SLIDES_TEX)

watch-slides:
	$(LATEX) watch $(SLIDES_TEX)

clean:
	$(LATEX) clean $(MAIN_TEX)

clean-slides:
	$(LATEX) clean $(SLIDES_TEX)
