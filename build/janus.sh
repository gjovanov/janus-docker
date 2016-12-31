#!/bin/sh

apt-get install -y \
    dh-autoreconf git \
    libmicrohttpd-dev libjansson-dev libnice-dev libssl-dev libsrtp-dev \
    libsofia-sip-ua-dev libglib2.0-dev libopus-dev libogg-dev \
    libini-config-dev libcollection-dev pkg-config gengetopt

cd $HOME
git clone https://github.com/meetecho/janus-gateway.git

cd janus-gateway
    ./autogen.sh
    ./configure --prefix=/usr \
                --disable-docs \
                --disable-rabbitmq \
                # --disable-websockets \
                # --disable-data-channels \
                #

    make && make install
cd ..

rm -r janus-gateway
