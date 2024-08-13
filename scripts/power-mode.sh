#!/bin/sh

currentMode=$(powerprofilesctl get)

case $currentMode in 
    performance)
        powerprofilesctl set power-saver
        ;;
    balanced)
        powerprofilesctl set performance
        ;;
    power-saver)
        powerprofilesctl set balanced
        ;;
esac

notify-send -ew --icon=noel --app-name="Power Profile" $(powerprofilesctl get)
