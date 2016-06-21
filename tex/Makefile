DOCS=transpose
SOURCE=$(DOC).tex

DVIFOLDER=../dvi
PSFOLDER=../ps
PDFFOLDER=../pdf

PDFFILE=$(PDFFOLDER)/$(DOC).pdf
DVIFILE=$(DVIFOLDER)/$(DOC).dvi
PSFILE=$(PSFOLDER)/$(DOC).ps

DVIREQ=$(SOURCE) $(DOC)/*.tex
PSREQ=$(DVIFILE) $(SOURCE)
PDFREQ=$(PSREQ) $(PSFILE)

MAKEDIR=mkdir -p

RESIDUEFORMAT=aux lof log lot toc

all:
	for DOC in $(DOCS); do \
	  make DOC=$$DOC build_$$DOC; \
	done

build_$(DOC):
	make DOC=$$DOC $(PDFFILE);

$(PDFFILE): $(PDFREQ)
	$(MAKEDIR) $(PDFFOLDER)
	make DOC=$$DOC $(PSFILE)
	ps2pdf $(PSFILE) $(PDFFILE)

$(PSFILE): $(PSREQ)
	$(MAKEDIR) $(PSFOLDER)
	make DOC=$$DOC $(DVIFILE)
	dvips $(DVIFILE) -o $(PSFILE)

$(DVIFILE): $(DVIREQ)
	$(MAKEDIR) $(DVIFOLDER)
	latex $(SOURCE)
	latex $(SOURCE)
	make cleanresidue
	mv $(DOC).dvi $(DVIFILE)

cleanresidue:
	for FORMAT in $(RESIDUEFORMAT); do \
	  rm -f $(DOC).$$FORMAT; \
	done
