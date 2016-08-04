RUBYDIR=../ruby
TASKS=transpose
RUNNER=rake
TASK_REPORTS=data
REPORT=data
REPORT_FILE=$(TASK)/$(REPORT).dat
REPORT_REQUIREMENTS=''

all:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK build_$$TASK; \
	done

build_$(TASK):
	mkdir -p $(TASK)
	OLD_DIR=$$(pwd); \
	cd $(RUBYDIR); \
	TASK_REPORTS=$$($(RUNNER) data:list[$(TASK)]); \
	cd $$OLD_DIR; \
	for REPORT in $$TASK_REPORTS; do \
	  make TASK=$(TASK) REPORT=$$REPORT build_$(TASK)_$$REPORT; \
	done

build_$(TASK)_$(REPORT):
	OLD_DIR=$$(pwd); \
	cd $(RUBYDIR); \
	REPORT_REQUIREMENT=$$($(RUNNER) data:requirements[$(TASK),$(REPORT)]); \
	cd $$OLD_DIR; \
	make TASK=$(TASK) REPORT=$(REPORT) $(REPORT_FILE) REPORT_REQUIREMENS=$$REPORT_REQUIREMENT

$(REPORT_FILE): $(REPORT_REQUIREMENS)
	cd $(RUBYDIR); \
	$(RUNNER) data:create[$(TASK),$(REPORT)]

clean:
	for TASK in $(TASKS); do \
	  rm -rf $$TASK; \
	done

