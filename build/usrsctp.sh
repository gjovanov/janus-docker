#!/bin/sh

apt-get install -y subversion automake libtool

cd $HOME
svn co http://sctp-refimpl.googlecode.com/svn/trunk/KERN/usrsctp usrsctp

cd usrsctp
    ./bootstrap
    ./configure --prefix=/usr && make && make install
cd ..

rm -r usrsctp
