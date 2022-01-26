#!/bin/bash
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 0x9 /tmp/screen_locked_blured.png
i3lock -i /tmp/screen_locked_blured.png

