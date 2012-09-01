#!/bin/bash

cd /usr/local/src/rawtherapee
rm -rf ./build ./Release
mkdir build
cd build
CC="ccache gcc-mp-4.7" \
CXX="ccache g++-mp-4.7" \
cmake \
-DBUILD_BUNDLE:BOOL="ON" \
-DCMAKE_BUILD_TYPE:STRING="Release" \
-DCMAKE_OSX_ARCHITECTURES:STRING="x86_64" \
-DCMAKE_OSX_DEPLOYMENT_TARGET:STRING="10.6" \
-DCMAKE_OSX_SYSROOT:STRING="/Developer/SDKs/MacOSX10.6.sdk" \
-DPROC_TARGET_NUMBER:STRING="1" ..
make install -j3
cd - > /dev/null
mv ./build/Release ./
sed -i "" -e "s/ccache/gcc-mp-4/g" ./Release/AboutThisBuild.txt
cat <<EOF >> ./Release/AboutThisBuild.txt

***** Unofficial Bundle for MacOS *****

Bundle created by mattintosh4
https://github.com/mattintosh4/RawTherapee

Thanks to all developers.
EOF
curl -O https://raw.github.com/mattintosh4/RawTherapee/master/patch/start.patch
curl -O https://raw.github.com/mattintosh4/RawTherapee/master/patch/make-app-bundle.patch
curl -O https://raw.github.com/mattintosh4/RawTherapee/master/patch/info.plist.patch
patch -ubN -p0 < start.patch
patch -ubN -p0 < make-app-bundle.patch
patch -ubN -p0 < info.plist.patch
./tools/osx/make-app-bundle
