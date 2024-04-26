TARBALLS:=../tarballs
PWD:=$(shell pwd)
KERNEL_FILE:=busybox-1.36.1.tar.bz2
KERNEL_TAR_PATH=$(TARBALLS)/$(KERNEL_FILE)
DIR:=$(PWD)/linux
EXPORTDIR:=../imagefiles
ARCH:=x86
IMAGE:=bzImage
KERNEL_CONFIG=$(PWD)/kernel-config # default config
THREAD_COUNT=16 # parallel jobs count modify according to your system

all: build_kernel

build_kernel: prep
	make -j $(THREAD_COUNT) -C $(DIR)
	cp -v $(DIR)/arch/$(ARCH)/boot/$(IMAGE) $(EXPORTDIR)/

prep:
	@if [ ! -d $(DIR) ]; then \
		mkdir -p $(DIR); \
		tar xf $(KERNEL_TAR_PATH) -C $(DIR) --strip-components=1; \
	fi;
	@if [ ! -f $(DIR)/.config ]; then make config; fi

config:
	make -j4 -C $(DIR) distclean
	sudo cp $(KERNEL_CONFIG) $(DIR)/.config

subdir:
	sudo tar xf $(TARBALL)
	sudo patch -p1 -d $(DIR) < patchfile
	sudo cp -a patchfile $(MARKER)

allclean: clean
clean:
	@rm -rf $(DIR) pf
