#!/bin/bash

if [ ! -f arch/arm/boot/uImage ]
then
	echo "!!!Cannot find uImage"
	exit
fi

if [ -b /dev/sdc ]
then
	echo "Writing uImage..."
	dd iflag=dsync oflag=dsync if=arch/arm/boot/uImage of=/dev/sdc seek=4096
	echo "Writing dtbs..."
	dd iflag=dsync oflag=dsync if=arch/arm/boot/dts/exynos4412-landrover.dtb of=/dev/sdc seek=2048
else
	echo "WARNING: plugin the usb device, check device name to be /dev/sdc"
fi

#if [ -f ramdisk.gz ]
#then
#	echo "Writing Ramdisk..."
#	dd iflag=dsync oflag=dsync if=ramdisk.gz of=/dev/sdc seek=0x2100
#fi

