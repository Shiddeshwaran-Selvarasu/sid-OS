TARBALLS:=../tarballs
PWD:=$(shell pwd)
KERNEL_FILE:=linux-6.8.7.tar.xz
KERNEL_TAR_PATH=$(TARBALLS)/$(KERNEL_FILE)
DIR:=$(PWD)/linux

all: build_kernel

build_kernel: copy_kernel_src
	

copy_kernel_src:
	@if [ ! -d $(DIR) ]; then \
		mkdir -p $(DIR); \
		tar xf $(KERNEL_TAR_PATH) -C $(DIR) --strip-components=1; \
	fi;

allclean: clean
clean:
	@rm -rf $(TARBALLS)/*
