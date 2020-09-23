#! /bin/bash
# Terminate already running bar instances
killall -w -q polybar -s SIGINT

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null 2> /dev/null; do sleep 1; done

polybar -q $1 & > /dev/null 2> /dev/null
polybar-msg cmd toggle > /dev/null 2> /dev/null
notify-send -t 1000 -u low -i dialog-information "Launch" "Polybar launched correctly"
