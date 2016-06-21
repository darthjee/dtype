DOCS=transpose
SOURCE=$(DOC).tex
DVIFOLDER=../dvi
PDFFILE=$(DOC).pdf
DVIFILE=$(DVIFOLDER)/$(DOC).dvi

RESIDUEFORMAT=aux lof log lot toc

all:
	for DOC in $(DOCS); do \
	  make DOC=$$DOC pdf; \
	done

pdf:
	make DOC=$$DOC $(PDFFILE)

$(PDFFILE):
	make DOC=$$DOC $(DVIFILE)

$(DVIFILE):
	mkdir $(DVIFOLDER)
	latex $(SOURCE)
	latex $(SOURCE)
	make cleanresidue
	mv $(DOC).dvi $(DVIFILE)

cleanresidue:
	for FORMAT in $(RESIDUEFORMAT); do \
	  rm -f $(DOC).$$FORMAT; \
	done
