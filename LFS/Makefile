include make.inc

MD5SUMS:=$(realpath ../pull_tarballs)/md5sums

TOOLCHAIN_DIR=$(realpath ./toolchain)

all: prep

build_toolchain:
	sudo make -C $(TOOLCHAIN_DIR) all

prep:
	@sudo ./setup-base-structure.sh tarballs=$(TARBALLS) lfs=$(LFS) sources=$(SOURCES) md5sum=$(MD5SUMS)

allclean:
	@sudo rm -rf $(LFS)
