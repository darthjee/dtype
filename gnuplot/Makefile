FOLDERS=transpose
OUT=file.eps
IN=file.gnu
EPSFOLDER=../eps
MKDIR=mkdir -p

all:
	for DIR in $(FOLDERS); do \
	  $(MKDIR) $(EPSFOLDER)/$$DIR; \
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
	rm -rf $(EPSFOLDER)
