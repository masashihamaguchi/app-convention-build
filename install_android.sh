#!/bin/sh

echo '=============================='
echo 'APK Install Tool'

path="android_output/*"
dirs=`find $path -type f -maxdepth 0`

for dir in $dirs;
do
  name=$(basename ${dir})
  echo "\ninstall $name"

  # install apk
  adb install $dir
done

echo '\nfinish\n'
