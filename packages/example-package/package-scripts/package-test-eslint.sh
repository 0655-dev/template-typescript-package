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

ROOT_DIR=.
SRC_DIR=$ROOT_DIR/src
DIST_DIR=$ROOT_DIR/dist

# eslint-wrapper --help

ESLINTRC=$ROOT_DIR/.eslintrc.js

echo ""
echo "[INFO] running eslint against source code"

# eslint sometimes misses some files
# so, instead we use find to find all matching files,
# sort them,
# and pipe into eslint via xargs

( \
	find \
		$SRC_DIR \
		\( -type f -and -name "*.js" \) -or \
		\( -type f -and -name "*.jsx" \) -or \
		\( -type f -and -name "*.ts" \) -or \
		\( -type f -and -name "*.tsx" \) \
	| \
	sort \
		--stable \
		--ignore-case \
		--field-separator=/ \
		--key=2.2 \
		--key=2.1 \
	| \
	xargs \
		pnpx eslint \
			--quiet \
			--config="$ESLINTRC" \
)

echo "[INFO] eslint checks passed!"
echo ""