#!/usr/bin/env bash
# Manage logout with rofi

lock() {
    $HOME/.config/scripts/transfer-sleep.sh
}

option=$( echo -e "lock screen\nsuspend\nhibernate\nreboot\nlogout\npoweroff" | rofi -width 200 -dmenu -p "Select Power Option" )

case $option in
    'lock screen')
        lock
        ;;
    logout)
        i3-nagbar -t warning -m 'Are you sure you  want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'
        ;;
    suspend)
        #/usr/bin/systemctl suspend #-then-hibernate
        /usr/bin/systemctl suspend-then-hibernate
        ;;
    hibernate)
        #/usr/bin/systemctl suspend #-then-hibernate
        /usr/bin/systemctl hibernate
        ;;
    reboot)
        /usr/bin/systemctl reboot
        ;;
    poweroff)
        /usr/bin/systemctl poweroff
        ;;
esac
