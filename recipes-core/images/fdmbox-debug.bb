# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

# Include modules in rootfs
IMAGE_INSTALL += " \
	kernel-modules \
	octoprint \
	nano \
	openssh-sftp \
	usbutils \
	"

#SPLASH = "psplash-fdmbox"

IMAGE_FEATURES += "ssh-server-dropbear splash"
