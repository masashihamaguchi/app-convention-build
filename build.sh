#!/bin/sh

echo '=============================='
echo 'Application Build Tool\n'

# for ios
chmod +x build_ios.sh
./build_ios.sh

# for android
chmod +x build_android.sh
./build_android.sh
