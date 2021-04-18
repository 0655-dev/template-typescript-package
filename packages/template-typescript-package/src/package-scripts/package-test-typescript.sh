#!/usr/bin/env bash

# WARNING: this package is auto-generated from a template
# do not try to make changes in here, they will be overwritten

#
# turn this on to debug script
# set -x

#
# abort on error
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail


PACKAGE_ROOT="."
SRC_DIR="$PACKAGE_ROOT/src"
DIST_DIR="$PACKAGE_ROOT/dist"

echo ""
echo "[INFO] starting typescript test"

CREATE_BUILD_DIR () {
	echo "[INFO] creating build dir...";
	BUILD_DIR='./build';
	BUILD_DIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir');
	echo "[INFO] done";
}

COPY_ASSETS_TO_BUILD_DIR () {
	echo "[INFO] copying assets into build dir...";
	rsync \
		--update \
		--recursive \
		--exclude='*.ts' \
		--exclude='*.tsx' \
		--include='*' \
		$SRC_DIR/ \
		"$BUILD_DIR"
	echo "[INFO] done";
}

BUILD_TS () {
	echo "[INFO] compiling ts into build dir...";
		pnpx \
		tsc \
		--outDir "$BUILD_DIR";
	# ls -al $BUILD_DIR;
	echo "[INFO] done";
}

DESTROY_BUILD_DIR () {
	echo "[INFO] cleaning up build...";
	rm -rf $BUILD_DIR;
	echo "[INFO] done";
}

CLEANUP () {
	DESTROY_BUILD_DIR || true;
}

BUILD () {
	trap CLEANUP ERR EXIT;
	CREATE_BUILD_DIR;
	COPY_ASSETS_TO_BUILD_DIR;
	BUILD_TS;
}

BUILD;

echo ""