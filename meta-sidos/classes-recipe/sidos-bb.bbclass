# SUMMARY = "Sidos beaglebone image (core-image)"
# 
# LICENSE = "CLOSED"

MACHINE = "beaglebone-yocto"

DISTRO = "poky"

IMAGE_FEATURES += "splash ssh-server-openssh package-management"

inherit core-image