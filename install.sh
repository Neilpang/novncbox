#!/usr/bin/env bash

set -e

apt-get update -qqy && apt-get upgrade -qqy

apt-get install -qqy ca-certificates

apt-get install -qqy \
net-tools \
openbox \
x11vnc \
xvfb \
python \
firefox-esr \
menu \
git \
ttf-wqy-zenhei

chmod +x *.sh


mkdir -p ~/.config/openbox/
rm -f ~/.config/openbox/autostart.sh

ln -s $(pwd)/autostart.sh ~/.config/openbox/autostart.sh
ln -s $(pwd)/rc.xml ~/.config/openbox/rc.xml

(cd ~ && rm -rf noVNC && git clone https://github.com/Neilpang/noVNC.git)
(cd ~/noVNC && ln -s vnc_auto.html index.html)


