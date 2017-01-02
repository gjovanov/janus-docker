#!/usr/bin/env bash

apt-get -y clean
apt-get -y autoclean
apt-get -y autoremove
rm -rf $DEPS_HOME/share
rm -rf $DEPS_HOME/dl
rm -rf /usr/share/locale/*
rm -rf /var/cache/debconf/*-old
rm -rf /usr/share/doc/*
rm -rf /var/lib/apt/*
rm -rf /var/lib/apt/lists/* /var/tmp/*
