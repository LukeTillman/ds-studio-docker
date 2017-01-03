#!/bin/sh

# Bail if anything fails
set -e

# Set the STUDIO_VERSION so it can be used then run docker build
. "`dirname $0`/STUDIO_VERSION"

docker build --build-arg STUDIO_VERSION=$STUDIO_VERSION -t luketillman/datastax-studio:$STUDIO_VERSION .