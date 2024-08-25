include ../make.inc

TOOLS_LIST = binutils gcc linux-api-headers glibc stdcpp

all: check
	for zzz in $(TOOLS_LIST); do make -C $$zzz $@ || exit 1; done

allclean:
	@rm -rf $(BUILD_DIR)

.PHONY: check

check:
ifdef LFS
ifneq ($(LFS),)
	$(info LFS is set to "$(LFS)")
else
	$(error "************************* LFS is set but empty this could potentially ruin your Operating System *************************")
endif
else
	$(error "************************* LFS is not set this could potentially ruin your Operating System *************************")
endif
