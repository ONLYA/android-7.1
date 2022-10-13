#!/bin/bash

# For Ubuntu 16.04

set -xe
python $(which repo) init -u https://android.googlesource.com/platform/manifest -b android-7.1.2_r11 --depth=1
rm -rf .repo/local_manifests
git clone https://github.com/ayufan-pine64/local_manifests -b nougat-7.1 .repo/local_manifests
#copy in fixed manifest
cp ~/fixedDefaultManifestsAndroid7.xml .repo/local_manifests/default.xml
python $(which repo) sync -j 20 -c --force-sync
cp ~/fixedLibcedarcConfig.mk ./frameworks/av/media/libcedarc/config.mk

sed -i '/$(call inherit-product, vendor\/opengapps\/build\/opengapps-packages.mk)/d' /android-7.1/device/softwinner/tulip-chiphd/tulip_chiphd.mk

pushd $(pwd)/vendor/ayufan-pine64/boot-tools/
sed -i "/sdc1_used/c\sdc1_used = 0" blobs/sys_config_pine64-sopine.fex
make clean && make
rm -Rf linux
popd
