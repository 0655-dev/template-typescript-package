#!/usr/bin/env bash

# WARNING: this package is a controlled file generated from a template
# do not try to make changes in here, they will be overwritten

# if you want to make changes to the package config, edit the config extras file instead

# the current directory is assumed to be the package root by all scripts
PACKAGE_ROOT=.
PACKAGE_NAME=package
PACKAGE_CONFIG=$PACKAGE_ROOT/package-config.sh
PACKAGE_EXTRAS=$PACKAGE_ROOT/package-config.extras.sh


PACKAGE_SRC=$PACKAGE_ROOT/src
PACKAGE_DIST=$PACKAGE_ROOT/dist

PACKAGE_SCRIPTS=$PACKAGE_ROOT/package-scripts
PACKAGE_MODULES=$PACKAGE_ROOT/node_modules
PACKAGE_SOURCE_MAP=$PACKAGE_ROOT/.sourcemap
PACKAGE_MODULE_MAP=$PACKAGE_ROOT/.modulemap

PACKAGE_USE_SOURCE_HASH=1 # this flag is used to enable source hashing for rebuild checks
PACKAGE_USE_MODULE_HASH=1 # this flag is used to enable module hashing for reinstall checks

PACKAGE_USE_MOCHA=1	# this flag is used to enable or disable mocha testing
PACKAGE_MOCHA_ARGS=	# this variable can be used to set default parameters to always be passed to mocha 
MOCHA="${MOCHA:-}" # this variable can be used to pass parameters to mocha at invocation


PACKAGE_USE_ESLINT=1	# this flag is used to enable or disable eslint testing
PACKAGE_ESLINTRC=$PACKAGE_ROOT/.eslintrc.js

PACKAGE_PRETTIERRC=$PACKAGE_ROOT/.prettierrc.js

# a hook for executing custom scripts before the source check
PACKAGE_PRE_HASH_HOOK=""
# a hook for executing custom scripts after the source check
PACKAGE_POST_HASH_HOOK=""
# a hook for executing custom scripts before the build
PACKAGE_PRE_BUILD_HOOK=""
# a hook for executing custom scripts after the build
PACKAGE_POST_BUILD_HOOK=""

source $PACKAGE_EXTRAS