#!/bin/bash

connected_hdmi=$(cat /sys/class/drm/card0/*HDMI*/status | grep -c '^connected')
#connected_hdmi=$( xrandr | grep ' connected' | grep 'HDMI' | wc -l )

cache="$HOME/.cache/hdmi_connected" 

[[ -e "${cache}" ]] || touch "${cache}"

if [[ $(cat "${cache}") != "${connected_hdmi}" ]]; then
    case "${connected_hdmi}" in
        1) $HOME/.screenlayout/dual-monitor.sh;;
        *) $HOME/.screenlayout/single-monitor.sh;;
    esac

    echo "${connected_hdmi}" > "${cache}"

fi

