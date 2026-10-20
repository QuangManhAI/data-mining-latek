# ==============================================================================
# MAKEFILE CHO DỰ ÁN BÁO CÁO LATEX UTH DATA MINING
# ==============================================================================

MAIN = main
COMPILER = xelatex
BIBTEX = bibtex

.PHONY: all clean view pdf

all: pdf

pdf: $(MAIN).tex
	$(COMPILER) -synctex=1 -interaction=nonstopmode $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(COMPILER) -synctex=1 -interaction=nonstopmode $(MAIN).tex
	$(COMPILER) -synctex=1 -interaction=nonstopmode $(MAIN).tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.synctex.gz *.fdb_latexmk *.fls
	rm -f sections/*.aux tables/*.aux figures/*.aux config/*.aux

distclean: clean
	rm -f $(MAIN).pdf

view: pdf
	xdg-open $(MAIN).pdf 2>/dev/null || open $(MAIN).pdf 2>/dev/null || start $(MAIN).pdf
