#!/usr/bin/env bash

#cp -a $JANUS_PATH/share/janus/demos/. $JANUS_PATH/web/
cd $SCRIPTS_PATH
npm init -y
npm i express body-parser errorhandler morgan --save

ln -s /usr/bin/nodejs /usr/bin/node
#http-server $JANUS_PATH/web/ --key $JANUS_PATH/certs/mycert.key --cert $JANUS_PATH/certs/mycert.pem -d false -p 8081 -c-1 --ssl >> /var/log/meetecho &

nodejs evapi.js >> /var/log/meetecho &
nodejs server.js >> /var/log/meetecho &
