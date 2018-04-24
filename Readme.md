FPGA-SoC-U-Boot-DE10-Nano
====================================================================================

Overview
------------------------------------------------------------------------------------

### Introduction

This Repository provides a U-Boot Image for DE10-Nano.

### Features

* U-Boot v2017.11 (customized)
  + Build for DE10-Nano
  + Customized boot by uEnv.txt
  + Customized boot by boot.scr
  + Enable bootmenu

Build U-boot for DE10-Nano
------------------------------------------------------------------------------------

There are two ways

1. run scripts/build-u-boot-2017.11-de10-nano.sh (easy)
2. run this chapter step-by-step (annoying)

### Download U-boot Source

#### Clone from git.denx.de/u-boot.git

```console
shell$ git clone git://git.denx.de/u-boot.git u-boot-2017.11-de10-nano
```

#### Checkout v2017.11

```console
shell$ cd u-boot-2017.11-de10-nano
shell$ git checkout -b u-boot-2017.11-de10-nano refs/tags/v2017.11
```

### Patch for de10-nano

```console
shell$ patch -p0 < ../files/u-boot-2017.11-de10-nano.diff
shell$ git add --update
shell$ git commit -m "patch for de10-nano"
shell$ git tag -a v2017.11-1-de10-nano -m "Release v2017.11-1 for de10-nano"
```

### Setup for Build 

```console
shell$ cd u-boot-2017.11-de10-nano
shell$ export ARCH=arm
shell$ export CROSS_COMPILE=arm-linux-gnueabihf-
shell$ make socfpga_de10_nano_defconfig
```

### Build u-boot

```console
shell$ make
```

### Copy u-boot.img, u-boot.elf and u-boot-spl.sfp to root directory

```console
shell$ cp spl/u-boot-spl.sfp ../u-boot-spl.sfp
shell$ cp u-boot.img         ../u-boot.img
```
