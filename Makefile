DOCS=transpose
SOURCE=tex/$(DOC).tex

all:
	for DOC in $(DOCS); do \
	  make DOC=$$DOC $$DOC.pdf; \
	done

$(DOC).pdf:
	make DOC=$$DOC $$DOC.dvi

$(DOC).dvi:
	latex $(SOURCE)
