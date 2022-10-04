#!/bin/bash
set -xe
repo init -u https://android.googlesource.com/platform/manifest -b android-7.1.2_r11 --depth=1
rm -rf .repo/local_manifests
git clone https://github.com/ayufan-pine64/local_manifests -b nougat-7.1 .repo/local_manifests
#copy in fixed manifest
cp ~/fixedDefaultManifestsAndroid7.xml .repo/local_manifests/default.xml
repo sync -j 20 -c --force-sync
#cp ../fixGitConfigAndroid7OpengapsSourceAll ./vendor/opengapps/sources/all/.git/config
#cp ../fixGitConfigAndroid7OpengapsSourceArm ./vendor/opengapps/sources/arm/.git/config
#cp ../fixGitConfigAndroid7OpengapsSourceArm64 ./vendor/opengapps/sources/arm64/.git/config
#repo forall -r '.*opengapps.*' -c 'git lfs fetch && git lfs checkout'
cp ~/fixedLibcedarcConfig.mk ./frameworks/av/media/libcedarc/config.mk
#tar -xf ../inx-aosp7-overlay.tar.bz2
#cp ../do-aosp-build.sh ./
