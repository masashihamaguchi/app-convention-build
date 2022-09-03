#!/bin/sh

echo '=============================='
echo 'IPA Install Tool'

path="ios_output/*"
dirs=`find $path -type f -maxdepth 0`

for dir in $dirs;
do
  name=$(basename ${dir})
  echo "\nipa: $name"

  # install ipa
  ios-deploy --bundle $dir
done

echo '\nfinish\n'
