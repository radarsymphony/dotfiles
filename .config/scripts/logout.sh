#!/usr/bin/env bash
# Manage logout with rofi
option=$( echo -e "lock screen\nsuspend\nreboot\nlogout\npoweroff" | rofi -width 200 -dmenu -p "Select Power Option" )
case $option in
    'lock screen')
	$HOME/.config/scripts/lock.sh
        ;;
    suspend)
        /usr/bin/systemctl suspend #-then-hibernate
        ;;
    reboot)
        /usr/bin/systemctl reboot
        ;;
    logout)
        i3-nagbar -t warning -m 'Are you sure you  want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'
        ;;
    poweroff)
        /usr/bin/systemctl poweroff
        ;;
esac
