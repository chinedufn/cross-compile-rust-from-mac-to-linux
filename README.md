# Cross Compile Rust from Mac to Linux

> An example of how to cross compile Rust from `macOS` to Linux `x86_64-unknown-linux-gnu`

## Background / Initial Motivation

As of November 2020 I use [Kubernetes in Docker][kind] on my macOS laptop to iterate on Kubernetes cluster changes before applying
them to my production cluster.

Miscellaneous things like making sure that a tweak to my nginx ingress-controller settings work.

When I bring up my local cluster I compile and then load in a few dockerized Rust binaries.

I work on a Mac, so I was compiling the Rust server inside of a `debian` based Docker image.

I've come to learn that anything disk I/O heavy is slow when running inside of Docker for Mac.

Compiling large Rust programs is disk I/O heavy.

So, after waiting 20 minutes for a single binary to compile with no end in sight, I hit `Ctrl-C`
and started looking into cross compilation.

Cross compilation gets tricky when your application uses OpenSSL.

Several of my applications use OpenSSL.

Fortunately I was able to get things working after a bit of Googling and reading and trial and error.

This repository is an example of cross compiling from macOS to `x86_64-unknown-linux-gnu`.

## To Run

```
rustup target add x86_64-unknown-linux-gnu

# Install a pre-built cross compiler
brew tap SergioBenitez/osxct
brew install x86_64-unknown-linux-gnu

# Hop in the repository
git clone git@github.com:chinedufn/cross-compile-rust-from-mac-to-linux.git
cd cross-compile-rust-from-mac-to-linux

# Download libssl-dev so that we can statically link to it during compilation
#  (reqwest needs this)
./download-libssl-dev.sh

# Cross compile to x86_64-unknown-linux-gnu
./build.sh

# Run the binary in a Docker image
./run.sh

# You should see "It worked." in your terminal.
```

## See Also

- [Tim Ryan's cross compiling tutorial][cross-compiling-linux-binaries-from-macos]
  - This repository was originally based on this tutorial

[cross-compiling-linux-binaries-from-macos]: https://timryan.org/2018/07/27/cross-compiling-linux-binaries-from-macos.html
[kind]: https://github.com/kubernetes-sigs/kind


