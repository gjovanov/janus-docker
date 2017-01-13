#!/usr/bin/env bash

rm -rf /var/lib/apt/*

cd $SCRIPTS_PATH
npm init -y
npm i express body-parser errorhandler morgan --save
ln -s /usr/bin/nodejs /usr/bin/node
nodejs evapi.js >> /var/log/meetecho &
nodejs server.js >> /var/log/meetecho &


cd $JANUS_PATH/bin
./janus -L /var/log/meetecho --rtp-port-range=10000-10200
tail -f /var/log/meetecho
