#!/usr/bin/env bash

cd $DEPS_HOME/dl
git clone https://github.com/cisco/libsrtp.git
cd libsrtp
git checkout v1.5.0
./configure --prefix=$DEPS_HOME --enable-openssl
make libsrtp.so
make install
