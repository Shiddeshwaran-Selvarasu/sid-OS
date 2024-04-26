TARBALLS:=../tarballs
PWD:=$(shell pwd)
FILELIST=$(PWD)/filelist

all: dir getfiles

tarballs: all

getfiles:
	cd $(TARBALLS); \
     for url in $$(cat $(FILELIST)); do \
        wget --timestamping "$$url"; \
    done

dir:
	@sudo mkdir -p $(TARBALLS)
	@sudo chmod 777 $(TARBALLS)

allclean: clean
clean:
	@rm -rf $(TARBALLS)/*
