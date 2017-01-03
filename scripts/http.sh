#!/usr/bin/env bash

cp $JANUS_PATH/share/janus/demos/* $JANUS_PATH/web/
npm install http-server -g
ln -s /usr/bin/nodejs /usr/bin/node
http-server $JANUS_PATH/web/ --key $JANUS_PATH/certs/mycert.key --cert $JANUS_PATH/certs/mycert.pem -d false -p 8081 -c-1 --ssl &

npm install http -g
nodejs /evapi.js >> /var/log/meetecho &
