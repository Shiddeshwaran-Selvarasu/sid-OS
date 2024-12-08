SUMMARY = "Configure Custom Sudo user"
DESCRIPTION = "Recipe for adding custom sudo user and add default shell as bash"
LICENSE="CLOSED"

SRC_URI = "file://.bashrc"

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

DEPENDS += " bash"

inherit useradd

USER_NAME = "sid"
USER_GROUP = "sidos"

USERADD_PACKAGES = "${PN}"
USERADD_PARAM:${PN} = "-u 1200 -d /home/${USER_NAME} -m -s /bin/bash -p 'sapkvI8mqw72o' ${USER_NAME}" # password: Sid123@

GROUPADD_PARAM:${PN} = "-g 880 ${USER_GROUP}"

do_install () {
    install -d -m 755 ${D}${homedir}/${USER_NAME}

    install -p -m 644 .bashrc ${D}${homedir}/${USER_NAME}/

    chown -R ${USER_NAME} ${D}${homedir}/${USER_NAME}

    chgrp -R ${USER_GROUP} ${D}${homedir}/${USER_NAME}

    # Add sudo accesses for user.
    install -d -m 0710 "${D}/etc/sudoers.d"
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" > "${D}/etc/sudoers.d/0001_${USER_NAME}"
    chmod 0644 "${D}/etc/sudoers.d/0001_${USER_NAME}"
}

FILES:${PN} += "${homedir} \
                ${homedir}/${USER_NAME} \
                ${homedir}/${USER_NAME}/.bashrc \
                /etc/sudoers.d \
                /etc/sudoers.d/0001_${USER_NAME}"

# Prevents do_package failures with:
# debugsources.list: No such file or directory:
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

