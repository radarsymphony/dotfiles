#!/bin/bash

# Define the zenity command to run and search for
cal_cmd="zenity --calendar --ok-label=Select --date-format=%Y/%-m/%-d"

# If an existing calendar is already present, remove it and exit to "toggle"
pkill -fx "${cal_cmd}"
[[ ${?} -eq 0 ]] && exit

# Run the zenity command and if a date is returned, open my calendar at that date
selected_date=$( eval "${cal_cmd}" ) 
if [[ ${?} -eq 0 ]]; then
	/usr/bin/firefox https://calendar.proton.me/u/2/day/${selected_date} 
fi 
