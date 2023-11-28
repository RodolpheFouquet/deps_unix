#!/bin/sh -x

DEST=$2

echo "Compilation of OpenHEVC"

branch="ffmpeg_update"

#git submodule update --init

cd ./openHEVC/

git checkout --force "$branch"
git fetch
git reset --hard FETCH_HEAD

if [ "$2" = "rebuild" ] || [ ! -f ffbuild/config.mak ] ; then

  make clean
  ./configure --disable-debug --disable-iconv --enable-pic

fi

make openhevc-static || exit 1


mkdir -p $DEST/extra_lib/include/libopenhevc
cp ./libopenhevc/*.h  $DEST/extra_lib/include/libopenhevc

mkdir -p  $DEST/extra_lib/lib/gcc
cp ./libopenhevc/libopenhevc.a  $DEST/extra_lib/lib/gcc
cd ..
