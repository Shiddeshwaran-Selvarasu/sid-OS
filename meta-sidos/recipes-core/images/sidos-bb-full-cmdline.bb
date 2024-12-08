SUMMARY = "Sidos beaglebone image full command line (core-image)"

LICENSE = "CLOSED"

CORE_IMAGE_EXTRA_INSTALL:append = " sudo bash vim add-custom-users"

IMAGE_INSTALL = "\
    packagegroup-core-boot \
    packagegroup-core-full-cmdline \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

inherit sidos-bb
