#!/bin/sh
cd /root/
mkdir html
git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
git checkout v0.2.1
sh autogen.sh
./configure --prefix=/opt/janus --disable-rabbitmq --disable-mqtt --enable-post-processing
make
make install
cp html/* ../html/
cd ..
rm -rf janus-gateway
