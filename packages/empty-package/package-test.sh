#!/usr/bin/env bash

#
# abort on error
set -e

rm -rf ./dist && mkdir ./dist;

cp ./package-bootstrap.sh ./dist/;

# we need to 'trick' pnpm into thinking this is not a CI run, so that it doesn't freeze the lockfile for this test
( \
	cd ./dist \
	&& ./package-bootstrap.sh \
	&& CI='' CONTINUOUS_INTEGRATION='' BUILD_NUMBER='' RUN_ID='' make test \
);

rm -rf ./dist;