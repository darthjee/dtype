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
	TEXDIR=$$(/bin/bash -c 'cd ../../tex; pwd'); \
	OUT=$$TEXDIR/$(TARGET).tex; \
	IN=doc.tex.erb; \
	REQUIREMENTS=$$(/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) tex:requirements[$(TARGET)]'); \
	make TARGET=$(TARGET) OUT=$$OUT IN=$$CURRENTDIR/$$IN REQUIREMENTS="$$REQUIREMENTS" $$OUT

$(OUT): $(IN) $(REQUIREMENTS)
	/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) tex:build[$(TARGET),$(IN),$(OUT)]'

clean:
	for TARGET in $(TARGETS); do \
	  make TARGET=$$TARGET clean_$$TARGET; \
	done

clean_$(TARGET):
	TEXDIR=$$(/bin/bash -c 'cd ../../tex; pwd'); \
	OUT=$$TEXDIR/$(TARGET).tex; \
	rm -f $$OUT

