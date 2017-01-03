#!/usr/bin/env bash

cd $JANUS_PATH/dl
git clone https://github.com/cisco/libsrtp.git
cd libsrtp
git checkout v1.5.0
./configure --prefix=$USR_PATH --enable-openssl
make libsrtp.so
make install
