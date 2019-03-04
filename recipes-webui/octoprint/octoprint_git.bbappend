FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://octoprint.init \
	    file://start_octoprint.sh"

inherit update-rc.d 

INITSCRIPT_NAME = "octoprint"
INITSCRIPT_PARAMS = "defaults 99"


FILES_${PN} += "/opt/start_octoprint.sh"

do_install_append(){
    install -d ${D}${sysconfdir}/init.d
    install -d ${D}/opt
    install -m 0755 ${WORKDIR}/start_octoprint.sh ${D}/opt/start_octoprint.sh
    install -m 0755 ${WORKDIR}/octoprint.init ${D}${sysconfdir}/init.d/octoprint
    sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${sysconfdir}/init.d/octoprint
    sed -i 's,/etc/,${sysconfdir}/,g'  ${D}${sysconfdir}/init.d/octoprint
    sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}/opt/start_octoprint.sh
    sed -i 's,/opt/,/opt/,g'  ${D}/opt/start_octoprint.sh

}
