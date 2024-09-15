# refer the below link for detailed info what is done in this makefile and why 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter05/glibc.html

include ../../make.inc

SRC_FILE="glibc-2.39.tar.xz"
MODULE_NAME="glibc"
MODULE_PATCH_PATH="glibc-2.39-fhs-1.patch"

MODULE_PATH=$(BUILD_DIR)/$(MODULE_NAME)

TMP_DIR=$(MODULE_PATH)/build

all: untar prep patch build

post_build: build
	@sed '/RTLDLIST=/s@/usr@@g' -i $(LFS)/usr/bin/ldd

test: 
	@echo $(shell $(MODULE_PATH)/scripts/config.guess)

build: patch
	@cd $(TMP_DIR) && sudo ../configure						\
      --prefix=/usr                          				\
      --host=$(LFS_TGT)                    					\
      --build=$(shell $(MODULE_PATH)/scripts/config.guess) 	\
      --enable-kernel=4.19               					\
      --with-headers=$(LFS)/usr/include    					\
      --disable-nscd                     					\
      libc_cv_slibdir=/usr/lib

	@cd $(TMP_DIR) && sudo make
	@cd $(TMP_DIR) && sudo make DESTDIR=$(LFS) install

clean: 
	@echo "cleaning prev build files, if any..."
	@sudo rm -rf $(MODULE_PATH)

untar: clean
	@echo "untaring source files..."
	@mkdir -p $(BUILD_DIR) $(MODULE_PATH)
	@tar -xf $(SOURCES)/$(SRC_FILE) -C $(MODULE_PATH) --strip-components=1

patch: prep
	@cd $(MODULE_PATH) && patch -Np1 -i $(SOURCES)/$(MODULE_PATCH_PATH)
	@mkdir -p $(TMP_DIR)
	@cd $(TMP_DIR) && echo "rootsbindir=/usr/sbin" > configparms

prep: untar
	@case $$(uname -m) in \
	i?86) \
		ln -sfv $(MODULE_PATH)/ld-linux.so.2 $(LFS)/lib/ld-lsb.so.3 ;; \
	x86_64) \
		ln -sfv $(MODULE_PATH)/../lib/ld-linux-x86-64.so.2 $(LFS)/lib64 ;\
		ln -sfv $(MODULE_PATH)/../lib/ld-linux-x86-64.so.2 $(LFS)/lib64/ld-lsb-x86-64.so.3 ;; \
	esac