RUBYDIR=../../ruby
RUNNER=rake
TASKS=transpose
DIR=

all:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK build_$$TASK; \
	done

build_$(TASK):
	mkdir -p ../../gnuplot/$(TASK)
	TASK_GRAPHS=$$(/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) gnuplot:list[$(TASK)]'); \
	for GRAPH in $$TASK_GRAPHS; do \
	  make TASK=$(TASK) GRAPH=$$GRAPH build_$(TASK)_$$GRAPH; \
	done

build_$(TASK)_$(GRAPH):
	CURRENTDIR=$$(pwd); \
	GNUDIR=$$(/bin/bash -c 'cd ../../gnuplot; pwd'); \
	OUT=$$GNUDIR/$(TASK)/$(GRAPH).gnu; \
	IN=plot.gnu.erb; \
	REQUIREMENTS=$$(/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) gnuplot:requirements[$(TASK),$(GRAPH)]'); \
	make TASK=$(TASK) GRAPH=$(GRAPH) OUT=$$OUT IN=$$CURRENTDIR/$$IN REQUIREMENTS="$$REQUIREMENTS" $$OUT

$(OUT): $(IN) $(REQUIREMENTS)
	/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) gnuplot:build[$(TASK),$(GRAPH),$(IN),$(OUT)]'

clean:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK clean_$$TASK; \
	done

clean_$(TASK):
	GNUDIR=$$(/bin/bash -c 'cd ../../gnuplot; pwd'); \
	OUT=$$GNUDIR/$(TASK); \
	rm -rf $$OUT

