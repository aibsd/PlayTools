#!/bin/sh
# BUILD_PATH=~/Library/Developer/Xcode/DerivedData/PlayTools-<YOUR-UUID>/Build/Products/Debug-iphoneos
BUILD_PATH=~/Library/Developer/Xcode/DerivedData/PlayTools-fltvwzcgypsmnxfmxcnckaohxfet/Build/Products/Debug-iphoneos
echo "Converting to maccatalyst"
vtool \
	-set-build-version maccatalyst 11.0 14.0 \
	-replace -output \
	"$BUILD_PATH/PlayTools.framework/PlayTools" \
	"$BUILD_PATH/PlayTools.framework/PlayTools"

echo "Codesigning PlayTools"
codesign -fs- "$BUILD_PATH/PlayTools.framework/PlayTools"

echo "Copying to PlayCover"
rm -r "/Applications/PlayCover.app/Contents/Frameworks/PlayTools.framework"
cp -r "$BUILD_PATH/PlayTools.framework" "/Applications/PlayCover.app/Contents/Frameworks/"

# target_bundle_id=com.miHoYo.Yuanshen.app
target_bundle_id=com.aibsd.TestGame.app

rm -rf ~/Library/Containers/io.playcover.PlayCover/Applications/$target_bundle_id/PlugIns/AKInterface.bundle
rm -rf ~/Library/Containers/io.playcover.PlayCover/Applications/$target_bundle_id/zh-Hans.lproj
rm -rf ~/Library/Containers/io.playcover.PlayCover/Applications/$target_bundle_id/en.lproj

cp -r $BUILD_PATH/PlayTools.framework/PlugIns/AKInterface.bundle ~/Library/Containers/io.playcover.PlayCover/Applications/$target_bundle_id/PlugIns
cp -r $BUILD_PATH/PlayTools.framework/*.lproj ~/Library/Containers/io.playcover.PlayCover/Applications/$target_bundle_id/