#!/bin/sh

apt-get install -y git dh-autoreconf libssl-dev

cd $HOME
git clone https://github.com/alanxz/rabbitmq-c

cd rabbitmq-c
    git submodule init
    git submodule update
    autoreconf -i
    ./configure --prefix=/usr && make && make install
cd ..

rm -r rabbitmq-c
