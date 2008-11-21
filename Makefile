TARGET := chep09proof.pdf
SOURCES = $(wildcard *.tex)

#LATEX := pdflatex
LATEX := latex
BIBTEX := bibtex
DVIPS := dvips
PS2PDF := ps2pdf14

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES)

#%.pdf: %.tex
%.dvi: %.tex
	$(LATEX) $*
#	$(BIBTEX) $*
#	$(LATEX) $*
	fgrep 'Rerun to get' $*.log > /dev/null && $(LATEX) $*

%.ps: %.dvi
	$(DVIPS) -t a4 -f $* -o $@

%.pdf: %.ps
	$(PS2PDF) -dPDFSETTINGS=/prepress $< $@

clean:
	rm -f *.aux *.log *.toc *.blg *.bbl *.out *.dvi *.ps $(TARGET)