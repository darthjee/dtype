FOLDERS=transpose
OUT=file.eps
IN=file.gnu

all:
	for DIR in $(FOLDERS); do \
	  make DIR=$$DIR build_$$DIR; \
	done

build_$(DIR):
	for SCRIPT in $(DIR)/*.gnu ; do \
	  if [ -a $$SCRIPT ]; then \
	    TARGET=$$(cat $$SCRIPT | grep out | grep .eps); \
	    TARGET=$${TARGET#*\"}; \
	    TARGET=$${TARGET%\"*}; \
	    make IN=$$SCRIPT  OUT=$$TARGET $$TARGET; \
	  fi \
	done

$(OUT): $(IN)
	gnuplot $(IN)

