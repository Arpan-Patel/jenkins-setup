#!/bin/bash

echo 'Build'

java -version

#cd /data/lumus-sd82/jenkins_build
cd /home/arpan/Work/lumus_src
source build/envsetup.sh
lunch msm8996-userdebug


#java -version
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
#export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
#export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/li
#java -version
#make update-api

make
