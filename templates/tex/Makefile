TARGETS=transpose
DIR=

all:
	for TARGET in $(TARGETS); do \
	  make TARGET=$$TARGET build_$$TARGET; \
	done

build_$(TARGET):
	CURRENTDIR=$$(pwd); \
	PARENTDIR=$${CURRENTDIR%/*}; \
	PARENTDIR=$${PARENTDIR%/*}; \
	TEXDIR=$$PARENTDIR/tex; \
	OUT=$$TEXDIR/$(TARGET).tex; \
	IN=doc.tex.erb; \
	make OUT=$$OUT IN=$$IN $$OUT; \

$(OUT): $(IN)
	cp $(IN) $(OUT)
