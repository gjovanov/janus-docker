#!/usr/bin/env bash

cp $DEPS_HOME/share/janus/demos/* $DEPS_HOME/web
npm install http-server -g
ln -s /usr/bin/nodejs /usr/bin/node
http-server /root/janus/web/ --key /root/janus/certs/mycert.key --cert /root/janus/certs/mycert.pem -d false -p 8081 -c-1 --ssl &
