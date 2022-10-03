#!/bin/bash

set -xe


export TARGET='tulip_chiphd-userdebug'
export USE_CCACHE='true'
export ANDROID_JACK_VM_ARGS='-Xmx3g -Dfile.encoding=UTF-8 -XX:+TieredCompilation'
export ANDROID_NO_TEST_CHECK='true'
export CCACHE_DIR=$PWD/ccache


source build/envsetup.sh
lunch "${TARGET}"
make -j 2


echo "****************************************"
echo "************ CREATE IMAGE **************"
echo "****************************************"

IMG_FILE="android_7_1_pine64_a6.img.gz"

if [ -f $IMG_FILE ]; then
        echo "Backup image file ..."
        mv $IMG_FILE ..
fi

set -xe

sdcard_image $IMG_FILE "sopine"


