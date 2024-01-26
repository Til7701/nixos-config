#!/bin/sh

rsync -avh -e ssh 192.168.2.42:LocalMinecraftBackup/ /home/tilman/Documents/MinecraftBackup
