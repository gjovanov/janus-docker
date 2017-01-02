#!/bin/bash

cd $DEPS_HOME/dl
git clone https://github.com/sctplab/usrsctp
cd usrsctp
./bootstrap
./configure --prefix=$DEPS_HOME
make
make install
