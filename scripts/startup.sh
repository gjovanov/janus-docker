#!/usr/bin/env bash

cd $DEPS_HOME/bin
./janus --stun-server=stun.l.google.com:19302 -L /var/log/meetecho --rtp-port-range=10000-10200
tail -f /var/log/meetecho
