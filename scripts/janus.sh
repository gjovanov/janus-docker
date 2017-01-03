#!/usr/bin/env bash

cd $JANUS_PATH/dl
git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
git checkout v0.2.1
./autogen.sh
./configure --prefix=$JANUS_PATH --disable-rabbitmq --disable-mqtt --disable-docs --enable-post-processing
make
make install
make configs
