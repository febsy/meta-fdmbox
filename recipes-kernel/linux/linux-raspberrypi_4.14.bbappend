# We do not want that linux writes output to the UART-Port, so we set console to tty1
CMDLINE = "dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"

# Remove the kernel debugger over console kernel command line option if enabled
CMDLINE_append = ''

# Disable rpi logo on boot
CMDLINE_append += ' ${@oe.utils.conditional("DISABLE_RPI_BOOT_LOGO", "1", "logo.nologo", "", d)}'
