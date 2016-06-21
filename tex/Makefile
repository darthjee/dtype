DOCS=transpose
SOURCE=$(DOC).tex
DVIFOLDER=../dvi
PSFOLDER=../ps
PDFFILE=$(DOC).pdf
DVIFILE=$(DVIFOLDER)/$(DOC).dvi
PSFILE=$(PSFOLDER)/$(DOC).ps

MAKEDIR=mkdir -p

RESIDUEFORMAT=aux lof log lot toc

all:
	for DOC in $(DOCS); do \
	  make DOC=$$DOC pdf; \
	done

pdf:
	make DOC=$$DOC $(PDFFILE)

$(PDFFILE):
	make DOC=$$DOC $(PSFILE)

$(PSFILE):
	$(MAKEDIR) $(PSFOLDER)
	make DOC=$$DOC $(DVIFILE)
	dvips $(DVIFILE) -o $(PSFILE)

$(DVIFILE):
	$(MAKEDIR) $(DVIFOLDER)
	latex $(SOURCE)
	latex $(SOURCE)
	make cleanresidue
	mv $(DOC).dvi $(DVIFILE)

cleanresidue:
	for FORMAT in $(RESIDUEFORMAT); do \
	  rm -f $(DOC).$$FORMAT; \
	done
