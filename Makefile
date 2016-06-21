ALL=tex

all:
	for DIR in $(ALL); do \
	  cd $$DIR; make; \
	done

