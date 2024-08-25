# include ../../make.inc

# SRC_FILE="binutils-2.42.tar.xz"
# MODULE_NAME="binutils"

# MODULE_PATH=$(BUILD_DIR)/$(MODULE_NAME)

# TMP_DIR=$(MODULE_PATH)/build

# all: untar build

# build: untar
# 	@cd $(TMP_DIR) && sudo ../configure		\
# 	--prefix=$(LFS)/tools 				\
# 	--with-sysroot=$(LFS) 				\
# 	--target=$(LFS_TGT) 				\
# 	--disable-nls --enable-gprofng=no 	\
# 	--disable-werror 					\
# 	--enable-default-hash-style=gnu

# 	@sudo make -C $(TMP_DIR)
# 	@sudo make -C $(TMP_DIR) install

# clean:
# 	@rm -rf $(BUILD_DIR)

# untar:
# 	@mkdir -p $(BUILD_DIR) $(MODULE_PATH)
# 	@tar -xf $(SOURCES)/$(SRC_FILE) -C $(MODULE_PATH) --strip-components=1
# 	@mkdir -p $(TMP_DIR)