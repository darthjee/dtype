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
	OLD_DIR=$$(pwd); \
	cd $(RUBYDIR); \
	REQUIREMENTS=$$($(RUNNER) tex:requirements[$(TARGET)]); \
	cd $$OLD_DIR; \
	make TARGET=$(TARGET) OUT=$$OUT IN=$$CURRENTDIR/$$IN REQUIREMENTS="$$REQUIREMENTS" $$OUT

$(OUT): $(IN) $(REQUIREMENTS)
	cd $(RUBYDIR); \
	$(RUNNER) tex:build[$(TARGET),$(IN),$(OUT)]
