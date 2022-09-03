#!/bin/sh

echo '=============================='
echo 'Android Project Build Tool'

CURRENT=$(cd $(dirname $0);pwd)

path="android/*"
dirs=`find $path -type d -maxdepth 0`

for dir in $dirs;
do
  name=$(basename ${dir})
  echo "\nproject name is $name\n"

  rm -r "$CURRENT/$dir/app/build/outputs/apk/debug"
  cd $dir

  # generate apk file
  chmod +x ./gradlew
  ./gradlew assembleDebug

  # copy apk file
  cp "app/build/outputs/apk/debug/app-debug.apk" "$CURRENT/android_output/$name-app-debug.apk"

  cd $CURRENT
done

echo '\nfinish\n'
