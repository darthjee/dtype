TASKS=data gnuplot templates tex

all:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK build_$$TASK; \
	done

build_$(TASK):
	  cd $$TASK; make;

