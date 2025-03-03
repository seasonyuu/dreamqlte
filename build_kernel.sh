#!/bin/bash

make clean
make mrproper
export KERNELNAME=FusionLeo-Kernel
export VERSION_NUMBER=V1.3
export KERNEL=$KERNELNAME.$VERSION_NUMBER
export ARCH=arm64
export BUILD_CROSS_COMPILE=/home/peter/Desktop/Toolchain/aarch64-linux-android-4.9/bin/aarch64-linux-android-
BUILD_JOB_NUMBER=`grep processor /proc/cpuinfo|wc -l`

mkdir out

make -C $(pwd) O=$(pwd)out -j$BUILD_JOB_NUMBER ARCH=$ARCH CROSS_COMPILE=$BUILD_CROSS_COMPILE KCFLAGS=-mno-android greatqlte_chn_open_defconfig
make -C $(pwd) O=$(pwd)out -j$BUILD_JOB_NUMBER ARCH=$ARCH CROSS_COMPILE=$BUILD_CROSS_COMPILE KCFLAGS=-mno-android

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

