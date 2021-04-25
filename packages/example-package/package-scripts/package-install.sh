#!/usr/bin/env bash

# WARNING: this package is a controlled file generated from a template
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

_check_env () {
	for tool in "$@"
	do
		if ! [ -x "$(command -v $tool)" ]; then
			echo "[ERROR] $tool not found, aborting..." >&2
			exit 1
		fi
	done
}

_check_env pnpm;

pnpm install --filter $PACKAGE_ROOT
