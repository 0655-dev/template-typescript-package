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

if [ "$PACKAGE_USE_JEST" = false ]; then exit 0; fi

echo ""
echo "[INFO] running jest tests"

pnpx jest --roots $PACKAGE_DIST --testRegex="((/__tests__/.*|(\\.|/)(spec))\\.[jt]sx?)|((/__tests__/.*|(\\.|/)(spec))/index\\.[jt]sx?)$"

echo "[INFO] jest unit tests passed!"
echo ""