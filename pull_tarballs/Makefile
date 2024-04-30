TARBALLS:=../tarballs
PWD:=$(shell pwd)
FILELIST=$(PWD)/filelist

all: dir getfiles

tarballs: all

getfiles:
	wget --input-file=$(FILELIST) --continue --directory-prefix=$(TARBALLS)

dir:
	@sudo mkdir -p $(TARBALLS)
	@sudo chmod 777 $(TARBALLS)

allclean: clean
clean:cd 
	@rm -rf $(TARBALLS)/*
