#!/bin/sh

echo '=============================='
echo 'App Convention Build\n'

dirs=("ios" "android" "ios_output" "android_output")

echo 'check directories...'

for dir in ${dirs[@]};
do
  if [ -d $dir ]; then
    echo "$dir ok!"
  else
    echo "create directory $dir"
    mkdir $dir
  fi
done

echo '=============================='

chmod +x build.sh
chmod +x build_ios.sh
chmod +x build_android.sh

chmod +x install.sh
chmod +x install_ios.sh
chmod +x install_android.sh
