#!/bin/bash
DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`

echo 'Archive'

#sudo mkdir -p /data/lumus-sd82/build_artifacts_sd82/$DIR_NAME
#sudo chmod 777 /data/lumus-sd82/build_artifacts_sd82/$DIR_NAME

mkdir -p /home/arpan/Work/releases_lumus/$DIR_NAME
#chmod 777 /home/arpan/Work/releases_lumus/$DIR_NAME

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
#echo '/home/arpan/Work/releases_lumus/'$DIR_NAME'/'$DIR_NAME'.tar.bz2'
ls -h *.tar.bz2

######
#automatically upload via transfer.sh
######

#transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
#tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

#transfer '/home/arpan/Work/releases_lumus/'$DIR_NAME'/'$DIR_NAME'.tar.bz2'
