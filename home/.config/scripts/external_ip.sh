#!/bin/bash

ext_ip=$(curl -s ifconfig.me/ip) && \
if zenity --question --ok-label=Copy --cancel-label=Cancel --text "External IP\n\n$ext_ip"; then 
    echo "$ext_ip" | xclip -selection clipboard
fi

