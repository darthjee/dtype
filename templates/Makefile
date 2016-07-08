all:
	for DIR in */; do \
	  make DIR=$$DIR build_$$DIR; \
	done

build_$(DIR):
	cd $(DIR); \
	make
