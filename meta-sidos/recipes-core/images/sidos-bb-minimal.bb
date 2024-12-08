SUMMARY = "Sidos beaglebone image minimal (core-image)"

LICENSE = "CLOSED"

CORE_IMAGE_EXTRA_INSTALL:append = " sudo bash vim add-custom-users"

IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}"

inherit sidos-bb

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"