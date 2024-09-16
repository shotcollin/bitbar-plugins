#!/bin/bash

# Display current time in UTC in the menu bar.
# Optionally display current time in one or more additional zones in the drop-down list.
# The display format HH:MM:SS will refresh every second when the file name ends with ".1s.sh", e.g. "worldclock.1s.sh".
# To refresh less frequently, e.g. every 30 seconds, rename the file "worldclock.30s.sh". In this case
# the format could be changed to remove seconds from the display by using `date -u +'UTC %H:%M %b %d'`.
#
# <bitbar.title>World Clock</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Adam Snodgrass</bitbar.author>
# <bitbar.author.github>asnodgrass</bitbar.author.github>
# <bitbar.desc>Display current UTC time in the menu bar, with various timezones in the drop-down menu</bitbar.desc>
# <bitbar.image>https://cloud.githubusercontent.com/assets/6187908/12207887/464ff8b2-b617-11e5-9d61-787eed228552.png</bitbar.image>

ZONES="Europe/Paris Europe/Amsterdam America/New_York America/Denver America/Los_Angeles"
date -u +'UTC %H:%M:%S %b %d'
echo '---'
for zone in $ZONES; do
  echo "$(TZ=$zone date +'%H:%M:%S %z') $zone"
done
