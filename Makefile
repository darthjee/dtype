TASKS=data gnuplot templates tex

all:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK build_$$TASK; \
	done

build_$(TASK):
	cd $$TASK; make;

clean:
	for TASK in $(TASKS); do \
	  make TASK=$$TASK clean_$$TASK; \
	done

clean_$(TASK):
	cd $$TASK; make clean;
