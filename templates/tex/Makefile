RUBYDIR=../../ruby
RUNNER=rake
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
	make TARGET=$(TARGET) OUT=$$OUT IN=$$CURRENTDIR/$$IN $$OUT

$(OUT): $(IN)
	cd $(RUBYDIR); \
	$(RUNNER) tex:build[$(TARGET),$(IN),$(OUT)]
