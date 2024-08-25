TARBALLS:=../tarballs
PWD:=$(shell pwd)
FILELIST=$(PWD)/filelist
FILES_LIST=$(PWD)/fileslist
PATCHES_LIST=$(PWD)/patcheslist

all: prep getfiles

tarballs: all

getfiles:
	wget --input-file=$(FILELIST) --continue --directory-prefix=$(TARBALLS)

prep:
	@sudo mkdir -p $(TARBALLS)
	@sudo chmod 777 $(TARBALLS)

	@cat $(FILES_LIST) > $(FILELIST)
	@echo "" >> $(FILELIST) 
	@cat $(PATCHES_LIST) >> $(FILELIST)

allclean: clean
clean:cd 
	@rm -rf $(TARBALLS)/*
