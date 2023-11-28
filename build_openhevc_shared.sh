#!/bin/sh -x

DEST=$2

echo "Compilation of OpenHEVC"

branch="ffmpeg_update"

cd ./openHEVC/

git checkout --force "$branch"
git fetch
git reset --hard FETCH_HEAD

make clean
./configure --disable-debug --disable-iconv
make openhevc-shared || exit 1


mkdir -p $DEST/extra_lib/include/libopenhevc
cp ./libopenhevc/*.h $DEST/extra_lib/include/libopenhevc

mkdir -p $DEST/bin/gcc
if [ -f ./libopenhevc/libopenhevc.so ]; then
	cp -af ./libopenhevc/libopenhevc.so* $DEST/bin/gcc
fi
if [ -f ./libopenhevc/libopenhevc.dylib ]; then
        cp -af ./libopenhevc/libopenhevc*.dylib $DEST/bin/gcc
fi
cd ..
