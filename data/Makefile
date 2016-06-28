RUBYDIR=../ruby
TASKS=transpose
RUNNER=rake
TASK_REPORTS=data
REPORT=data
REPORT_FILE=$(TASK)/$(REPORT).dat

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
	  REPORT_FILE=$(TASK)/$$REPORT.dat; \
	  make TASK=$(TASK) REPORT=$$REPORT $$REPORT_FILE; \
	done

$(REPORT_FILE):
	cd $(RUBYDIR); \
	$(RUNNER) $(TASK):data:$(REPORT)
	
