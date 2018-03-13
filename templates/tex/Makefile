RUBYDIR=../../ruby
RUNNER=rake
TARGETS=transpose
DIR=
REQUIREMENTS=$(find ../../ruby -type f)

all:
	for TARGET in $(TARGETS); do \
	  make TARGET=$$TARGET build_$$TARGET; \
	done

build_$(TARGET):
	CURRENTDIR=$$(pwd); \
	TEXDIR=$$(/bin/bash -c 'cd ../../tex; pwd'); \
	OUT=$$TEXDIR/$(TARGET).tex; \
	IN=doc.tex.erb; \
	make TARGET=$(TARGET) OUT=$$OUT IN=$$CURRENTDIR/$$IN $$OUT
	make TARGET=$(TARGET) build_$(TARGET)_parts

build_$(TARGET)_parts:
	CURRENTDIR=$$(pwd); \
	TEXDIR=$$(/bin/bash -c 'cd ../../tex; pwd'); \
	for IN in $(TARGET)/*.erb; do \
	  OUT=$$TEXDIR/$$IN; \
	  OUT=$${OUT%.erb}; \
	  NAME=$${OUT%.tex}; \
	  NAME=$${NAME##*/}; \
	  make TARGET=$(TARGET)/$$NAME OUT=$$OUT IN=$$CURRENTDIR/$$IN $$OUT; \
	done

$(OUT): $(IN) $(REQUIREMENTS)
	/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) tex:build[$(TARGET),$(IN),$(OUT)]'

clean:
	for TARGET in $(TARGETS); do \
	  make TARGET=$$TARGET clean_$$TARGET; \
	done

clean_$(TARGET):
	TEXDIR=$$(/bin/bash -c 'cd ../../tex; pwd'); \
	OUT=$$TEXDIR/$(TARGET).tex; \
	rm -f $$OUT; \
	CURRENTDIR=$$(pwd); \
	for IN in $(TARGET)/*.erb; do \
	  OUT=$$TEXDIR/$$IN; \
	  OUT=$${OUT%.erb}; \
	  rm -f $$OUT; \
	done

