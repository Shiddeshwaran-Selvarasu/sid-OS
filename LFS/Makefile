TARBALLS:=$(realpath ../tarballs)
RAMDIR?=/ram
LFS:=$(RAMDIR)/lfs
SOURCES:=$(LFS)/sources
MD5SUMS:=$(realpath ../pull_tarballs)/md5sums

all: prep sources-check create-rfs

prep:
	@echo "Testing LFS dir LFS=$(LFS)"
	sudo mkdir -pv $(SOURCES) 
	sudo chmod -v a+wt $(SOURCES)
	sudo cp -r $(TARBALLS)/* $(SOURCES)/
	sudo chown root:root $(SOURCES)/*

sources-check:
	cd $(SOURCES); \
	md5sum -c $(MD5SUMS);

create-rfs:
	@mkdir -pv $(LFS)/{etc,var,home,root} $(LFS)/usr/{bin,lib,sbin}
	@mkdir -pv $(LFS)/tools
	@ln -sv usr/bin $(LFS)/bin
	@ln -sv usr/lib $(LFS)/lib
	@ln -sv usr/sbin $(LFS)/sbin

	case $(uname -m) in x86_64) @mkdir -pv $(LFS)/lib64 ;; esac;

build-setup:
	@mkdir -pv $(LFS)/build
