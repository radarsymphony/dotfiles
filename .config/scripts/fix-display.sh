#!/bin/bash

pkill picom &

wait $!

/usr/bin/wal -R &

wait $!

$HOME/.fehbg &

wait $!

/usr/bin/picom --experimental-backends -b
