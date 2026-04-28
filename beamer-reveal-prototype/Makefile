SHELL := /bin/bash
JOB := slides
OUT := site
PERL5LIB ?= /tmp/beamerreveal-perl5/lib/perl5
PATH := /tmp/beamerreveal-perl5/bin:$(PATH)
LUAOTFLOAD_SOURCE := /opt/homebrew/Cellar/texlive/20260301/share/texmf-dist/tex/luatex/luaotfload
LUAOTFLOAD_PATCH_DIR := $(CURDIR)/.texlive-cache/luaotfload-patch
export TEXMFVAR := $(CURDIR)/.texlive-cache/texmf-var
export TEXMFCACHE := $(CURDIR)/.texlive-cache/texmf-cache
export LUAINPUTS := $(LUAOTFLOAD_PATCH_DIR)//:

.PHONY: pdf reveal clean check

check:
	@command -v lualatex >/dev/null || (echo "missing lualatex" && exit 1)
	@command -v pdftoppm >/dev/null || (echo "missing pdftoppm" && exit 1)
	@command -v pdfcrop >/dev/null || (echo "missing pdfcrop" && exit 1)
	@command -v ffmpeg >/dev/null || (echo "missing ffmpeg" && exit 1)
	@PERL5LIB=$(PERL5LIB) command -v beamer-reveal.pl >/dev/null || (echo "missing beamer-reveal.pl; install with: perl /tmp/cpanm -L /tmp/beamerreveal-perl5 --notest BeamerReveal" && exit 1)

$(LUAOTFLOAD_PATCH_DIR)/.ready:
	mkdir -p "$(LUAOTFLOAD_PATCH_DIR)" "$(TEXMFVAR)" "$(TEXMFCACHE)"
	cp "$(LUAOTFLOAD_SOURCE)/fontloader-basics-gen.lua" "$(LUAOTFLOAD_PATCH_DIR)/"
	cp "$(LUAOTFLOAD_SOURCE)/fontloader-reference.lua" "$(LUAOTFLOAD_PATCH_DIR)/"
	perl -0pi -e 's/if lfs\.isreadablefile and lfs\.iswritablefile then/if false and lfs.isreadablefile and lfs.iswritablefile then/g; s/if file\.is_writable\(cachepath\) then/if lfs.isdir(cachepath) or file.is_writable(cachepath) then/g' "$(LUAOTFLOAD_PATCH_DIR)"/fontloader-*.lua
	touch "$@"

pdf: $(LUAOTFLOAD_PATCH_DIR)/.ready
	mkdir -p "$(TEXMFVAR)" "$(TEXMFCACHE)"
	latexmk -lualatex -interaction=nonstopmode -halt-on-error $(JOB).tex

reveal: check pdf
	mkdir -p $(OUT)
	PERL5LIB=$(PERL5LIB) beamer-reveal.pl --output-directory $(OUT) $(JOB)

clean:
	latexmk -C $(JOB).tex
	rm -rf $(OUT) $(JOB).rvl $(JOB)_files .texlive-cache
