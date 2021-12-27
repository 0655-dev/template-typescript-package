#!/usr/bin/env bash

# WARNING: this package is a controlled file generated from a template
# do not try to make changes in here, they will be overwritten

#
# turn this on to debug script
# set -x

stdin=$(cat <&0)
if [[ $1 == "-r" ]] || [[ $1 == "--no-run-if-empty" ]]
then
    # shift the arguments to get rid of the "-r" that is not valid on OSX
    shift
    # wc -l return some whitespaces, let's get rid of them with tr
    linecount=$(echo $stdin | grep -v "^$" | wc -l | tr -d '[:space:]') 
    if [ "x$linecount" = "x0" ]
    then
      exit 0
    fi
fi

# grep returns an error code for no matching lines, so only activate error checks from here
set -e
set -o pipefail
echo $stdin | /usr/bin/xargs $@
