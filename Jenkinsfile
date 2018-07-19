pipeline {
  agent any
  stages {
    stage('Sync') {
      steps {
        echo 'Sync'
        sh '''echo \'sync, build and copy images\'

cd /home/arpan/Work/lumus_src
PATH=~/bin:$PATH

repo sync -j4

mkdir -p out/target/common/obj
if [ $? -eq 0 ]
	then
		echo "Directory created successfully"
        cp -vr vendor/qcom/proprietary/prebuilt/target/common/obj/JAVA_LIBRARIES out/target/common/obj/
	else
		echo "Failed to create out directory"
fi'''
      }
    }
    stage('Build') {
      steps {
        echo 'Build'
        sh '''#!/bin/bash
java -version



cd /home/arpan/Work/lumus_src
source build/envsetup.sh
lunch msm8996-userdebug
#make update-api

make'''
      }
    }
    stage('Archive') {
      steps {
        echo 'Archive'
        sh '''DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`

echo \'Archive\'

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

ls -h *.tar.bz2
'''
      }
    }
    stage('Deliver') {
      steps {
        echo 'Deliver'
        sh '''#!/bin/bash
DIR_NAME=Rel_$BUILD_ID-`date +%d-%m-%Y`

echo \'Deliver\'

#Need to transfer files into ftp server
echo \'Need to transfer files into ftp server\''''
      }
    }
  }
}