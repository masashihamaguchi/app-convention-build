#!/bin/sh

echo '=============================='
echo 'iOS Project Build Tool'

CURRENT=$(cd $(dirname $0);pwd)

path="ios/*"
dirs=`find $path -type d -maxdepth 0`

for dir in $dirs;
do
  projects=`find $dir -name '*.xcodeproj' -type d -maxdepth 1`
  workspaces=`find $dir -name '*.xcworkspace' -type d -maxdepth 1`

  name=$(basename ${projects[0]} .xcodeproj)
  echo "\nproject name is $name\n"

  cd $dir

  # generate archive file
  if [ "${workspaces[0]}" != '' ]; then

    workspace=$(basename ${workspaces[0]})
    xcodebuild -sdk "iphoneos" \
      -workspace $workspace \
      -scheme $name \
      -configuration Release \
      -archivePath "build/$name.xcarchive" clean archive

  else
    echo ''
    xcodebuild -sdk "iphoneos" \
      -scheme $name \
      -configuration Release \
      -archivePath "build/$name.xcarchive" clean archive

  fi

  # generate ipa file
  xcodebuild -exportArchive \
    -archivePath "build/$name.xcarchive" \
    -exportOptionsPlist "$CURRENT/config/export_ipa.plist" \
    -exportPath "build/ipa/"

  # copy ipa file
  cp "build/ipa/$name.ipa" "$CURRENT/ios_output/$name-develop.ipa"

  cd $CURRENT
done

echo '\nfinish\n'
