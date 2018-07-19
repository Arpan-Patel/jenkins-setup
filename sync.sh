#!/bin/bash
 
echo 'Sync'

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
fi
