#!/bin/bash

cd $JANUS_PATH/dl
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=$USR_PATH
make
make install
