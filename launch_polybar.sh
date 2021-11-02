#!/bin/bash
# launch_polybar.sh : script to start polybar on multiple screens.
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -r default &
done
