
apt-get -y --auto-remove purge $JANUS_DEPS_EXTRA
apt-get -y clean
apt-get -y autoclean
apt-get -y autoremove
rm -rf $JANUS_PATH/share/demos
rm -rf $JANUS_PATH/dl
rm -rf /usr/share/locale/*
rm -rf /var/cache/debconf/*-old
rm -rf /usr/share/doc/*
