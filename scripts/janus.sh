#!/usr/bin/env bash

cd $DEPS_HOME/dl
git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
git checkout v0.2.1
./autogen.sh
./configure --prefix=$DEPS_HOME --disable-rabbitmq --disable-mqtt --disable-docs
make
make install
make configs
