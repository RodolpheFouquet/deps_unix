#!/bin/sh -x

DEST=$2

echo "Compilation of libcaption"

branch="master"

#git submodule update --init

cd ./libcaption/

git checkout --force "$branch"
git fetch
git reset --hard FETCH_HEAD

make clean
cmake -DENABLE_RE2C=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON .
make || exit 1


mkdir -p $DEST/extra_lib/include/caption
cp ./caption/*.h $DEST/extra_lib/include/caption/

mkdir -p $DEST/extra_lib/lib/gcc
cp ./libcaption.a $DEST/extra_lib/lib/gcc
cd ..
