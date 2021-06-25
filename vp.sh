#!/bin/sh
VID_FOLDER=/home/mrrobot/fl/vids/
cd $VID_FOLDER

mpv "$(ls | dmenu -i -l 30)"
