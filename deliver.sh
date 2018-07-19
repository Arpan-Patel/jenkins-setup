#!/bin/bash
DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`

echo 'Deliver'

mkdir -p /home/arpan/Work/releases_lumus/$DIR_NAME

# move produced *.img to build artifacts dir:
cp -v /home/arpan/Work/releases_lumus/flash-images.sh /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/persist.img /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/cache.img /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/android-info.txt /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/boot.img /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/recovery.img /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/system.img /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/out/target/product/msm8996/userdata.img /home/arpan/Work/releases_lumus/$DIR_NAME

cp -v /home/arpan/Work/lumus_src/vendor/qcom/proprietary/prebuilt/target/product/msm8996/modem/NON-HLOS.bin /home/arpan/Work/releases_lumus/$DIR_NAME
cp -v /home/arpan/Work/lumus_src/vendor/qcom/proprietary/prebuilt/target/product/msm8996/aboot/emmc_appsboot.mbn /home/arpan/Work/releases_lumus/$DIR_NAME

echo /system/lib64/hw/sensors.invensense.so > /home/arpan/Work/releases_lumus/$DIR_NAME/system-etc-sensors-hals_I2C.conf
echo sensors.ssc.so > /home/arpan/Work/releases_lumus/$DIR_NAME/system-etc-sensors-hals_SSC.conf
echo qfp.wakeup.so >> /home/arpan/Work/releases_lumus/$DIR_NAME/system-etc-sensors-hals_SSC.conf

#create tar for *img files.
cd /home/arpan/Work/releases_lumus/$DIR_NAME
tar cfjv $DIR_NAME.tar.bz2 *
ls -h *.tar.bz2

#Need to transfer files into ftp server
