#!/usr/bin/env bash

set -e

export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &

sleep 5
openbox-session&


x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &




~/noVNC/utils/launch.sh

