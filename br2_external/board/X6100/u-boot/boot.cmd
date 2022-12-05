echo "------------ X6100 boot script ------------"
setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait panic=10 fbcon=rotate:3 ignore_loglevel
fatload mmc 0:1 0x46000000 zImage
fatload mmc 0:1 0x49000000 ${fdtfile}
bootz 0x46000000 - 0x49000000
