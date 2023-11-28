#!/bin/sh

ARCH="$1"
GPAC_DIR="$2"

[  -z "$GPAC_DIR" ] && GPAC_DIR="$(readlink -f ../gpac_public)"

./build_opensvc_static.sh "$ARCH" "$GPAC_DIR"


./build_openhevc_static.sh "$ARCH" "$GPAC_DIR"

./build_libcaption_static.sh "$ARCH" "$GPAC_DIR"

./build_mpegh_static.sh  "$ARCH" "$GPAC_DIR" || true
