RUBYDIR=../ruby
TASKS=transpose
RUNNER=rake
TASK_REPORTS=data
REPORT=data
REPORT_FILE=$(TASK)/$(REPORT).dat
REPORT_REQUIREMENTS=$$(find ../ruby -type f)

all:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK build_$$TASK; \
	done

build_$(TASK):
	mkdir -p $(TASK)
	TASK_REPORTS=$$(/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) data:list[$(TASK)]'); \
	for REPORT in $$TASK_REPORTS; do \
	  make TASK=$(TASK) REPORT=$$REPORT build_$(TASK)_$$REPORT; \
	done

build_$(TASK)_$(REPORT):
	make TASK=$(TASK) REPORT=$(REPORT) $(REPORT_FILE)

$(REPORT_FILE): $(REPORT_REQUIREMENS)
	/bin/bash -c 'cd $(RUBYDIR); $(RUNNER) data:create[$(TASK),$(REPORT)]'

clean:
	for TASK in $(TASKS); do \
	  rm -rf $$TASK; \
	done

