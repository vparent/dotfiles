# Terminate already running bar instances
killall -w -q polybar -s SIGINT

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null 2> /dev/null; do sleep 1; done

polybar -q $1 & > /dev/null 2> /dev/null

