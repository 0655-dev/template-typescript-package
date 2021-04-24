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

# import other vars from the package config
PACKAGE_ROOT=.
PACKAGE_CONFIG=$PACKAGE_ROOT/package-config.sh
source $PACKAGE_CONFIG

PACKGE_ROOT=.
PACKAGE_SRC=$PACKGE_ROOT/src
PACKAGE_DIST=$PACKGE_ROOT/dist
PACKAGE_TASKS=$PACKGE_ROOT/package-scripts

XARGS=$PACKAGE_TASKS/xargs-compat.sh

SCRIPT_START=`date +%s`

if [ "$PACKAGE_USE_MOCHA" = false ]; then exit 0; fi

echo ""
echo "[INFO] running mocha integration tests for $PACKAGE_NAME"


( \
	find \
		$PACKAGE_DIST \
		\( -type f -and -name "*mocha.tests.js" \) -or \
		\( -type f -and -path "*/*.mocha.tests/index.js" \) \
	| \
	sort \
		--stable \
		--ignore-case \
		--field-separator=/ \
		--key=2.2 \
		--key=2.1 \
	| \
	$XARGS -r \
		pnpx mocha $PACKAGE_MOCHA_ARGS $MOCHA
)

SCRIPT_END=`date +%s`
SCRIPT_RUNTIME=$((SCRIPT_END-SCRIPT_START))

echo "[INFO] mocha integration tests for $PACKAGE_NAME finished in ${SCRIPT_RUNTIME}s"
echo ""