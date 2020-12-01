#!/bin/bash

set -e

DIR="./target/run"

mkdir -p $DIR

cp Dockerfile "$DIR/"
cp target/x86_64-unknown-linux-gnu/debug/cross-compile "$DIR/program"

cd $DIR

docker run -it $(docker build -q .)
