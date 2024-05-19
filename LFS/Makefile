TARBALLS:=$(realpath ../tarballs)
RAMDIR?=/ram
LFS:=$(RAMDIR)/lfs
SOURCES:=$(LFS)/sources
CURRUSER:=$(shell echo $$USER)
MD5SUMS:=$(realpath ../pull_tarballs)/md5sums

all: prep

prep:
	@./setup-base-structure.sh tarballs=$(TARBALLS) lfs=$(LFS) sources=$(SOURCES) md5sum=$(MD5SUMS)

