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
	TASK_REPORTS=$$($(RUNNER) $(TASK):data:list); \
	cd $$OLD_DIR; \
	for REPORT in $$TASK_REPORTS; do \
	  make TASK=$(TASK) REPORT=$$REPORT build_$(TASK)_$$REPORT; \
	done

build_$(TASK)_$(REPORT):
	OLD_DIR=$$(pwd); \
	cd $(RUBYDIR); \
	REPORT_REQUIREMENT=$$($(RUNNER) $(TASK):data:$(REPORT):requirements); \
	cd $$OLD_DIR; \
	make TASK=$(TASK) REPORT=$(REPORT) $(REPORT_FILE) REPORT_REQUIREMENS="$$REPORT_REQUIREMENT"

$(REPORT_FILE): $(REPORT_REQUIREMENS)
	cd $(RUBYDIR); \
	$(RUNNER) $(TASK):data:$(REPORT)

clean:
	for TASK in $(TASKS); do \
	  rm -rf $$TASK; \
	done

