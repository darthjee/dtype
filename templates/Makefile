all:
	for DIR in */; do \
	  make DIR=$$DIR build_$$DIR; \
	done

build_$(DIR):
	cd $(DIR); \
	make

clean:
	for DIR in */; do \
	  make DIR=$$DIR clean_$$DIR; \
	done

clean_$(DIR):
	cd $(DIR); \
	make clean
