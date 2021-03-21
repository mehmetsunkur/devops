#! /bin/sh

echo "preBuild started... Current Dir:`pwd` ";
echo "Env vars:";
env;

SCRIPT=$0
SSCRIPTS=`dirname "$0"`;
cd $SSCRIPTS
SCRIPTS=`pwd`
DEV=$SCRIPTS/build
SDK=$DEV/sdk
rm -rf $DEV
DOWNLOADS=$SDK/downloads;
mkdir -p $DOWNLOADS;
wget -q https://corretto.aws/downloads/latest_checksum/amazon-corretto-8-x64-linux-jdk.tar.gz -P $DOWNLOADS
unzip -q -d $SDK $DOWNLOADS/amazon-corretto-8.242.08.1-linux-x64.zip-THIRDPARTY10.0.19.zip
JAVA_HOME=$SDK/amazon-corretto-8.242.08.1-linux-x64;
PATH=$PATH:$JAVA_HOME/bin;

PROJECT_ROOT="$(dirname "$(dirname "$(dirname $SCRIPTS)")")"

filename=$PROJECT_ROOT/gradle.properties

thekey="org.gradle.java.home"
newvalue="${JAVA_HOME}"
if ! grep -R "^[#]*\s*${thekey}=.*" $filename > /dev/null; then
  echo "APPENDING because '${thekey}' not found"
  echo "$thekey=$newvalue" >> $filename
else
  echo "SETTING because '${thekey}' found already"
  sed -ir "s|^[#]*\s*${thekey}=.*|$thekey=$newvalue|" $filename
fi
echo "The gradle.properties updated : cat ${filename}";
cat $filename;

cat >$SCRIPTS/build.sh <<'EOL'
echo "Build started... Current Dir:`pwd` "
SCRIPT=$0
SSCRIPTS=`dirname "$0"`;
cd $SSCRIPTS
SCRIPTS=`pwd`
PROJECT_ROOT="$(dirname "$(dirname "$(dirname $SCRIPTS)")")"
export JAVA_HOME=$SCRIPTS/build/sdk/amazon-corretto-8.242.08.1-linux-x64
sh ${PROJECT_ROOT}/gradlew -p=${PROJECT_ROOT} clean build -i -s
EOL

cat >$SCRIPTS/test.sh <<'EOL'
echo "Test started... Current Dir:`pwd` "
SCRIPT=$0
SSCRIPTS=`dirname "$0"`;
cd $SSCRIPTS
SCRIPTS=`pwd`
PROJECT_ROOT="$(dirname "$(dirname "$(dirname $SCRIPTS)")")"
export JAVA_HOME=$SCRIPTS/build/sdk/amazon-corretto-8.242.08.1-linux-x64
for i in 1 2 3; do 
  sh ${PROJECT_ROOT}/gradlew -p=${PROJECT_ROOT} clean testReport -i -s && break || echo "Trying again..."; 
done
EOL

cat >$SCRIPTS/package.sh <<'EOL'
echo "Package started... Current Dir:`pwd` "
SCRIPT=$0
SSCRIPTS=`dirname "$0"`;
cd $SSCRIPTS
SCRIPTS=`pwd`
PROJECT_ROOT="$(dirname "$(dirname "$(dirname $SCRIPTS)")")"
export JAVA_HOME=$SCRIPTS/build/sdk/amazon-corretto-8.242.08.1-linux-x64
sh ${PROJECT_ROOT}/gradlew -p=${PROJECT_ROOT} clean package -i -s
EOL

cat >$SCRIPTS/artifactUpload.sh <<'EOL'
echo "artifactUpload started... Current Dir:`pwd` "
SCRIPT=$0
SSCRIPTS=`dirname "$0"`;
cd $SSCRIPTS
SCRIPTS=`pwd`
PROJECT_ROOT="$(dirname "$(dirname "$(dirname $SCRIPTS)")")"
export JAVA_HOME=$SCRIPTS/build/sdk/amazon-corretto-8.242.08.1-linux-x64
sh ${PROJECT_ROOT}/gradlew -p=${PROJECT_ROOT} tasks -i -s
EOL
chmod +x ${SCRIPTS}/*.sh;

echo "cat ${SCRIPTS}/build.sh"
cat $SCRIPTS/build.sh
echo "cat ${SCRIPTS}/test.sh"
cat $SCRIPTS/test.sh
echo "cat ${SCRIPTS}/package.sh"
cat $SCRIPTS/package.sh

echo "Pre-build completed. You can run the below commands..";
echo "sh ${SCRIPTS}/build.sh"
echo "sh ${SCRIPTS}/test.sh"
echo "sh ${SCRIPTS}/package.sh"