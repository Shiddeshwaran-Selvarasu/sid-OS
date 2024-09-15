# refer the below link for detailed info what is done in this makefile and why 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter05/gcc-pass1.html

include ../../make.inc

SRC_FILE="gcc-13.2.0.tar.xz"
MODULE_NAME="gcc-stdcpp"

MODULE_PATH=$(BUILD_DIR)/$(MODULE_NAME)

TMP_DIR=$(MODULE_PATH)/build

all: clean untar build post_build

post_build: build
	@bash -c 'rm -v $(LFS)/usr/lib/lib{stdc++{,exp,fs},supc++}.la'

build: untar
	@cd $(TMP_DIR) && sudo ../libstdc++-v3/configure  \
    --host=$(LFS_TGT)                				  \
    --build=$(shell $(TMP_DIR)../config.guess)        \
    --prefix=/usr                                     \
    --disable-multilib                                \
    --disable-nls                                     \
    --disable-libstdcxx-pch                           \
    --with-gxx-include-dir=/tools/$(LFS_TGT)/include/c++/14.2.0


#   TODO:// fix the error in make refer: https://www.linuxquestions.org/questions/linux-from-scratch-13/make-error-in-libstdc-v3-4175736222/
	@cd $(TMP_DIR) && sudo make
	@cd $(TMP_DIR) && sudo make DESTDIR=$(LFS) install

untar: clean
	@echo "untaring source files..."
	@mkdir -p $(BUILD_DIR) $(MODULE_PATH)
	@tar -xf $(SOURCES)/$(SRC_FILE) -C $(MODULE_PATH) --strip-components=1
	@mkdir -p $(TMP_DIR)

clean: 
	@echo "cleaning prev build files, if any..."
	@sudo rm -rf $(MODULE_PATH)