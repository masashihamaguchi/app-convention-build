#!/bin/sh

echo '=============================='
echo 'App Convention Build\n'

dirs=("ios" "android" "ios_output" "android_output")
files=(".env.sample" "config/AppIDs.csv.sample")

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

echo '\ncheck files...'

for file in ${files[@]};
do
  d=$(dirname $file)
  f=$(basename $file .sample)
  if [ -f "$d/$f" ]; then
    echo "$f ok!"
  else
    echo "create file $f"
    cp $file "$d/$f"
  fi
done

echo '=============================='

chmod +x config.sh

chmod +x build.sh
chmod +x build_ios.sh
chmod +x build_android.sh

chmod +x install.sh
chmod +x install_ios.sh
chmod +x install_android.sh
