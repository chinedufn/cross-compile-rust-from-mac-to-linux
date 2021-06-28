#!/bin/bash

set -e

mkdir -p target
cd target

# From time to time the download link gets taken down and needs to be replaced with a new one.
# Here's where the current download link was found:
#  https://packages.debian.org/buster/amd64/libssl-dev/download
curl -O http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl-dev_1.1.1d-0+deb10u6_amd64.deb
ar p libssl-dev_1.1.1d-0+deb10u6_amd64.deb data.tar.xz | tar xvf -
rm -rf libssl-dev_1.1.1d-0+deb10u6_amd64.deb
