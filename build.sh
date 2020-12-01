#!/bin/bash

set -e

export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc

export OPENSSL_DIR="$(pwd)/target/usr/"
export OPENSSL_LIB_DIR="$(pwd)/target/usr/lib/x86_64-linux-gnu/"

cargo build --target=x86_64-unknown-linux-gnu
