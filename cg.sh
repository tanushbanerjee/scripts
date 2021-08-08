#!/usr/bin/env sh

######################################################################
# @author      : Tanush Banerjee (samihanbanerjew026@gmail.com)
# @file        : cg.sh
# @created     : Tue 06 Jul 2021 10:37:52 AM IST
#
# @description : This is a script which will search the selected text to
# google.
######################################################################

xclip -out -selection primary | xclip -in -selection clipboard
xclip -o sel clip > ~/.cache/cg.sh.cache
brave "https://search.brave.com/search?q=$(cat ~/.cache/cg.sh.cache)&source=desktop"
# vim: set tw=78 ts=2 et sw=2 sr:

