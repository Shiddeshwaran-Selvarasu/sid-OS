# SUBDIRS = pull_tarballs linux busybox bootloader image-builder
SUBDIRS = pull_tarballs LFS
RAMDIR?=/ram

help:
	@cat README
	@echo SUBDIRS = $(SUBDIRS)

all clean allclean: noroot
	@mkdir -p $(RAMDIR)
	for zzz in $(SUBDIRS); do make -C $$zzz $@ || exit 1; done

noroot:
	@if [ $(USER) = root ]; then \
	  echo "**************************************************************" ; \
	  echo "               YOU ARE DOING THIS THE WRONG WAY               " ; \
	  echo "It is a very bad idea to build as root. The build process will" ; \
	  echo "                     use sudo as necessary.                   " ; \
	  echo "**************************************************************" ; \
	  false ; \
	fi
