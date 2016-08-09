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
	    REQUIREMENT=$$(cat $$SCRIPT | grep plot | grep \\.dat | sed -e "s/.*'\\(.*\\)'.*/\\1/g"); \
	    make REQUIREMENT="$$REQUIREMENT" IN=$$SCRIPT  OUT=$$TARGET $$TARGET; \
	  fi \
	done

$(OUT): $(IN) $(REQUIREMENT)
	gnuplot $(IN)

clean:
	rm -rf $(EPSFOLDER)
