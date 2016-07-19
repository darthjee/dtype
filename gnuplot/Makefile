FOLDERS=transpose
OUT=file.eps
IN=file.gnu

all:
	for DIR in $(FOLDERS); do \
	  make DIR=$$DIR build_$$DIR; \
	done

build_$(DIR):
	for SCRIPT in $(DIR)/*.gnu ; do \
	  if [ -r $$SCRIPT ]; then \
	    TARGET=$$(cat $$SCRIPT | grep out | grep .eps); \
	    TARGET=$${TARGET#*\"}; \
	    TARGET=$${TARGET%\"*}; \
	    make IN=$$SCRIPT  OUT=$$TARGET $$TARGET; \
	  fi \
	done

$(OUT): $(IN)
	gnuplot $(IN)

clean:
	for DIR in $(FOLDERS); do \
	  make DIR=$$DIR clean_$$DIR; \
	done

clean_$(DIR):
	for SCRIPT in $(DIR)/*.gnu ; do \
	  if [ -r $$SCRIPT ]; then \
	    TARGET=$$(cat $$SCRIPT | grep out | grep .eps); \
	    TARGET=$${TARGET#*\"}; \
	    TARGET=$${TARGET%\"*}; \
	    rm -f  $$TARGET; \
	  fi \
	done

