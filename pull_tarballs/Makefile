TARBALLS:=../tarballs
SRC_TARBALLS=/opt/lfs-tarballs
PWD:=$(shell pwd)
FILELIST=$(PWD)/filelist
FILES_LIST=$(PWD)/fileslist
PATCHES_LIST=$(PWD)/patcheslist

all: prep getfiles

tarballs: all

getfiles:
	wget --input-file=$(FILELIST) --continue --directory-prefix=$(SRC_TARBALLS)

prep:
	@sudo mkdir -p $(SRC_TARBALLS)
	@sudo chmod 777 $(SRC_TARBALLS)
	@sudo ln -s $(SRC_TARBALLS) $(TARBALLS)

	@cat $(FILES_LIST) > $(FILELIST)
	@echo "" >> $(FILELIST) 
	@cat $(PATCHES_LIST) >> $(FILELIST)

allclean: clean

clean:
	@rm -rf $(TARBALLS)
