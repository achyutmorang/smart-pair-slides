#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="${1:-}"
MAIN_TEX="${2:-main.tex}"
OUTDIR="${LATEX_OUTDIR:-build}"
ENGINE="${LATEX_ENGINE:-auto}"

# Ensure TeX binaries are discoverable without requiring a terminal restart.
if [[ -x /usr/libexec/path_helper ]]; then
  eval "$(/usr/libexec/path_helper -s)"
fi

usage() {
  cat <<'EOF'
Usage:
  scripts/latex.sh build [main.tex]
  scripts/latex.sh watch [main.tex]
  scripts/latex.sh clean [main.tex]
EOF
}

if [[ -z "$MODE" ]]; then
  usage
  exit 1
fi

if [[ ! -f "$PROJECT_ROOT/$MAIN_TEX" ]]; then
  echo "Input file not found: $MAIN_TEX" >&2
  exit 1
fi

if [[ "$ENGINE" == "auto" ]]; then
  if command -v latexmk >/dev/null 2>&1 && command -v pdflatex >/dev/null 2>&1; then
    ENGINE="latexmk"
  elif command -v tectonic >/dev/null 2>&1; then
    ENGINE="tectonic"
  else
    echo "No LaTeX engine detected." >&2
    echo "Install MacTeX (latexmk+pdflatex) or Tectonic and rerun." >&2
    exit 1
  fi
fi

cd "$PROJECT_ROOT"
mkdir -p "$OUTDIR"

if [[ "$ENGINE" == "latexmk" ]]; then
  case "$MODE" in
    build)
      latexmk -pdf -interaction=nonstopmode -synctex=1 -file-line-error \
        -outdir="$OUTDIR" "$MAIN_TEX"
      ;;
    watch)
      latexmk -pdf -pvc -interaction=nonstopmode -synctex=1 -file-line-error \
        -outdir="$OUTDIR" "$MAIN_TEX"
      ;;
    clean)
      latexmk -c -outdir="$OUTDIR" "$MAIN_TEX"
      ;;
    *)
      usage
      exit 1
      ;;
  esac
else
  JOB_NAME="$(basename "${MAIN_TEX%.tex}")"
  case "$MODE" in
    build)
      tectonic -X compile --synctex -r 2 -o "$OUTDIR" "$MAIN_TEX"
      ;;
    watch)
      tectonic -X watch -x "compile --synctex -r 2 -o $OUTDIR $MAIN_TEX"
      ;;
    clean)
      rm -f "$OUTDIR/$JOB_NAME".{aux,bbl,bcf,blg,fls,log,out,run.xml,synctex.gz,toc,xdv}
      ;;
    *)
      usage
      exit 1
      ;;
  esac
fi
