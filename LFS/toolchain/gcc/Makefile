include ../../make.inc

SRC_FILE="gcc-13.2.0.tar.xz"
MODULE_NAME="gcc"

MODULE_PATH=$(BUILD_DIR)/$(MODULE_NAME)

TMP_DIR=$(MODULE_PATH)/build

all: untar prep build post_build

post_build: build
#   the $(LFS_TGT)-gcc path is getting created inside gcc/build instead of gcc need to fix it.... refer https://www.linuxfromscratch.org/lfs/view/stable/chapter05/gcc-pass1.html
	@cd $(TMP_DIR) && cat gcc/limitx.h gcc/glimits.h gcc/limity.h > $(shell dirname $$($(LFS_TGT)-gcc -print-libgcc-file-name))/include/limits.h

build: prep
	@cd $(TMP_DIR) && sudo ../configure  \
    --target=$(LFS_TGT)         \
    --prefix=$(LFS)/tools       \
    --with-glibc-version=2.39   \
    --with-sysroot=$(LFS)       \
    --with-newlib               \
    --without-headers           \
    --enable-default-pie        \
    --enable-default-ssp        \
    --disable-nls               \
    --disable-shared            \
    --disable-multilib          \
    --disable-threads           \
    --disable-libatomic         \
    --disable-libgomp           \
    --disable-libquadmath       \
    --disable-libssp            \
    --disable-libvtv            \
    --disable-libstdcxx         \
    --enable-languages=c,c++

	@cd $(TMP_DIR) && sudo make
	@cd $(TMP_DIR) && sudo make install

prep: untar
	@case $$(uname -m) in \
		x86_64) \
			sed -e '/m64=/s/lib64/lib/' -i.orig $(MODULE_PATH)/gcc/config/i386/t-linux64 ;; \
	esac

untar:
	@mkdir -p $(BUILD_DIR) $(MODULE_PATH) $(MODULE_PATH)/mpfr $(MODULE_PATH)/gmp $(MODULE_PATH)/mpc
	@tar -xf $(SOURCES)/$(SRC_FILE) -C $(MODULE_PATH) --strip-components=1
#	extract dependecies 
	@tar -xf $(SOURCES)/mpfr-4.2.1.tar.xz -C $(MODULE_PATH)/mpfr --strip-components=1
	@tar -xf $(SOURCES)/gmp-6.3.0.tar.xz -C $(MODULE_PATH)/gmp --strip-components=1
	@tar -xf $(SOURCES)/mpc-1.3.1.tar.gz -C $(MODULE_PATH)/mpc --strip-components=1

	@mkdir -p $(TMP_DIR)