#!/bin/sh
exec 2>&1
exec /usr/bin/janus --configs-folder=/etc/janus \
                    >>/var/log/janus.log
