#!/bin/bash

pkill picom &

wait $!

/usr/bin/wal -R -n -q &

wait $!

$HOME/.fehbg &

wait $!

/usr/bin/picom -b
