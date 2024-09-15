# refer the below link for detailed info what is done in this makefile and why 
# https://www.linuxfromscratch.org/lfs/view/stable/chapter05/linux-headers.html

include ../../make.inc

SRC_FILE="linux-6.8.7.tar.xz"
MODULE_NAME="linux"

MODULE_PATH=$(BUILD_DIR)/$(MODULE_NAME)

all: untar build

build: untar
	@cd $(MODULE_PATH) && sudo make mrproper && sudo make headers
	@cd $(MODULE_PATH) && sudo find usr/include -type f ! -name '*.h' -delete
	@cd $(MODULE_PATH) && sudo cp -rv usr/include $(LFS)/usr

clean: 
	@echo "cleaning prev build files, if any..."
	@sudo rm -rf $(MODULE_PATH)

untar: clean
	@echo "untaring source files..."
	@mkdir -p $(BUILD_DIR) $(MODULE_PATH)
	@tar -xf $(SOURCES)/$(SRC_FILE) -C $(MODULE_PATH) --strip-components=1