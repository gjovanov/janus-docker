#!/bin/sh

# Start demo server
npm install http-server -g
ln -s /usr/bin/nodejs /usr/bin/node
http-server /root/html/ --key /etc/janus/conf/cert/mycert.key --cert /etc/janus/conf/cert/mycert.pem -d false -p 8080 -c-1 --ssl &
