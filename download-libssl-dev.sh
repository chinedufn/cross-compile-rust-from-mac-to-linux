#!/bin/bash

set -e

cd target

curl -O http://ftp.br.debian.org/debian/pool/main/o/openssl/libssl-dev_1.1.1i-2_arm64.deb
ar p libssl-dev_1.1.1i-2_arm64.deb data.tar.xz | tar xvf -
rm -rf libssl-dev_1.1.1h-1_amd64.deb
