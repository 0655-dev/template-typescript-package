#!/usr/bin/env bash

#
# abort on error
set -e

rm -rf ./dist && mkdir ./dist;

cp ./package-init.sh ./dist/;

( \
	cd ./dist \
	&& ./package-init.sh \
	&& pnpm install --filter ./ --frozen-lockfile=false \
	&& make test \
);

rm -rf ./dist;