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
	GNUDIR=$$(/bin/bash -c 'cd ../../gnuplot; pwd'); \
	OUT=$$GNUDIR/$(TARGET)/binomial.gnu; \
	IN=plot.gnu.erb; \
	REQUIREMENTS=$$(/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) gnuplot:requirements[$(TARGET),binomial]'); \
	make TARGET=$(TARGET) OUT=$$OUT IN=$$CURRENTDIR/$$IN REQUIREMENTS="$$REQUIREMENTS" $$OUT

$(OUT): $(IN) $(REQUIREMENTS)
	/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) gnuplot:build[$(TARGET),binomial,$(IN),$(OUT)]'

clean:
	for TARGET in $(TARGETS); do \
	  make TARGET=$$TARGET clean_$$TARGET; \
	done

clean_$(TARGET):
	GNUDIR=$$(/bin/bash -c 'cd ../../gnuplot; pwd'); \
	OUT=$$GNUDIR/$(TARGET)/binomial.gnu; \
	rm -f $$OUT

