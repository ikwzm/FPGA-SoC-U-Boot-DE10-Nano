#!/bin/bash

UBOOT_BUILD_DIR=u-boot-2017.11-de10-nano

### Download U-Boot Source
git clone git://git.denx.de/u-boot.git $UBOOT_BUILD_DIR
cd $UBOOT_BUILD_DIR

#### Checkout v2017.11
git checkout -b u-boot-2017.11-de10-nano refs/tags/v2017.11

### Patch for de10-nano

patch -p0 < ../files/u-boot-2017.11-de10-nano.diff
git add --update
git commit -m "patch for de10-nano"

git tag -a v2017.11-1-de10-nano -m "Release v2017.11-1 for de10-nano"

### Setup for Build 

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make socfpga_de10_nano_defconfig

### Build u-boot

make

### Copy u-boot-spl.sfp and u-boot.img de10-nano/u-boot/

cp spl/u-boot-spl.sfp ../u-boot-spl.sfp
cp u-boot.img         ../u-boot.img
cd ..
