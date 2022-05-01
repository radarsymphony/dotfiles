#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage: "${0}" <i3_mark> <window_title>"
    echo "Example: ${0} 'scratch-emacs' 'emacsclient -c -a emacs'"
    exit 1
fi

I3_MARK=${1}
#LAUNCH_CMD=${2}

scratchpad_show() {
    i3-msg "[con_mark=${I3_MARK}]" scratchpad show
}

# try showing the scratchpad window
if ! scratchpad_show; then
    # if there is no such window...
    
    # Find zoom meeting
    i3-msg "[class=zoom] focus"  

    # Wait for the next window event.
    i3-msg -t subscribe  '[ "window" ]'

    # Set a mark
    i3-msg mark ${I3_MARK}

    # Move it to the scratchpad workspace
    i3-msg move scratchpad

    # show the scratchpad window
    scratchpad_show
fi
