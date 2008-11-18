TARGET := chep09proof.pdf
SOURCES = $(wildcard *.tex)

PDFLATEX := pdflatex
BIBTEX := bibtex

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES)

%.pdf: %.tex
	$(PDFLATEX) $*
#	$(BIBTEX) $*
#	$(PDFLATEX) $*
	fgrep 'Rerun to get' $*.log > /dev/null && $(PDFLATEX) $*

clean:
	rm -f *.aux *.log *.toc *.blg *.bbl *.out $(TARGET)