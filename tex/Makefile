DOCS=transpose
SOURCE=$(DOC).tex
DVIFOLDER=../dvis
PDFFILE=$(DOC).pdf
DVIFILE=$(DVIFOLDER)/$(DOC).dvi

all:
	for DOC in $(DOCS); do \
	  make DOC=$$DOC pdf; \
	done

pdf:
	make DOC=$$DOC $(PDFFILE)

$(PDFFILE):
	make DOC=$$DOC $(DVIFILE)

$(DVIFILE):
	latex $(SOURCE)

