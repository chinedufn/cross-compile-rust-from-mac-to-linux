#!/bin/bash

set -e

cd target

curl -O http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl-dev_1.0.1t-1+deb8u12_amd64.deb
ar p libssl-dev_1.0.1t-1+deb8u12_amd64.deb data.tar.xz | tar xvf -
rm -rf libssl-dev_1.0.1t-1+deb8u12_amd64.deb
