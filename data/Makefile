RUBYDIR=../ruby
TASKS=transpose
RUNNER=rake

all:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK build_$$TASK; \
	done

build_$(TASK):
	mkdir -p $(TASK)
	cd $(RUBYDIR); $(RUNNER) $(TASK):data
