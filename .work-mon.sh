#!/bin/bash
xrandr --auto
xrandr --output DP1 --right-of eDP1
/etc/cron.hourly/change_wallpaper
