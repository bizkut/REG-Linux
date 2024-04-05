#!/bin/bash

# HOST_DIR = host dir
# BOARD_DIR = board specific dir
# BUILD_DIR = base dir/build
# BINARIES_DIR = images dir
# TARGET_DIR = target dir
# BATOCERA_BINARIES_DIR = batocera binaries sub directory
# BATOCERA_TARGET_DIR = batocera target sub directory

HOST_DIR=$1
BOARD_DIR=$2
BUILD_DIR=$3
BINARIES_DIR=$4
TARGET_DIR=$5
BATOCERA_BINARIES_DIR=$6

mkdir -p "${BATOCERA_BINARIES_DIR}/boot/boot" 	  || exit 1
mkdir -p "${BATOCERA_BINARIES_DIR}/boot/extlinux" || exit 1


"${HOST_DIR}/bin/mkimage" -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux -d "${BINARIES_DIR}/Image" "${BATOCERA_BINARIES_DIR}/boot/boot/uImage" || exit 1
#cp "${BINARIES_DIR}/Image"           "${BATOCERA_BINARIES_DIR}/boot/boot/uImage"         || exit 1
cp "${BINARIES_DIR}/uInitrd"         "${BATOCERA_BINARIES_DIR}/boot/boot/uInitrd"         || exit 1
cp "${BINARIES_DIR}/rootfs.squashfs" "${BATOCERA_BINARIES_DIR}/boot/boot/batocera.update" || exit 1
cp "${BINARIES_DIR}/modules"         "${BATOCERA_BINARIES_DIR}/boot/boot/modules.update"  || exit 1
cp "${BINARIES_DIR}/firmware"        "${BATOCERA_BINARIES_DIR}/boot/boot/firmware.update" || exit 1

cp "${BOARD_DIR}/boot/boot-logo.bmp.gz" 	"${BATOCERA_BINARIES_DIR}/boot/"	  || exit 1
cp "${BOARD_DIR}/boot/README.txt"       	"${BATOCERA_BINARIES_DIR}/boot/"	  || exit 1
cp "${BOARD_DIR}/boot/uEnv.txt"       		"${BATOCERA_BINARIES_DIR}/boot/" 	  || exit 1


for DTB in meson-gxbb-minix-neo-u1.dtb meson-gxbb-nexbox-a95x.dtb meson-gxl-s905d-p230.dtb meson-gxl-s905d-p231.dtb meson-gxl-s905w-p281.dtb meson-gxl-s905w-tx3-mini.dtb meson-gxl-s905x-p212.dtb
do
	cp "${BINARIES_DIR}/${DTB}" "${BATOCERA_BINARIES_DIR}/boot/boot/" || exit 1
done

"${HOST_DIR}/bin/mkimage" -C none -A arm64 -T script -d "${BOARD_DIR}/boot/s905_autoscript.txt" "${BATOCERA_BINARIES_DIR}/boot/s905_autoscript" || exit 1
"${HOST_DIR}/bin/mkimage" -C none -A arm64 -T script -d "${BOARD_DIR}/boot/aml_autoscript.txt"  "${BATOCERA_BINARIES_DIR}/boot/aml_autoscript"  || exit 1
cp "${BOARD_DIR}/boot/aml_autoscript.zip" "${BATOCERA_BINARIES_DIR}/boot" || exit 1

exit 0
