#!/bin/sh

# kodi-send -a "Notification(XvBMC Firmware flash,Preparing and auto.Reboot when done...,5000,special://home/addons/script.xvbmc.update/icon.png)"

mount -o remount,rw /flash/
# cp -rav /storage/.kodi/addons/script.xvbmc.update/resources/bin/config-turbo.txt /flash/config.txt
 
curl https://raw.githubusercontent.com/XvBMC/repository.xvbmc/master/zips/update/firmware/XvBMCimage/v3/RC4/bootcode.bin -o /flash/bootcode.bin
curl https://raw.githubusercontent.com/XvBMC/repository.xvbmc/master/zips/update/firmware/XvBMCimage/v3/RC4/fixup_x.dat -o /flash/fixup.dat
curl https://raw.githubusercontent.com/XvBMC/repository.xvbmc/master/zips/update/firmware/XvBMCimage/v3/RC4/start_x.elf -o /flash/start.elf
 
kodi-send -a "Notification(XvBMC default Firmware re-flashed,REBOOT in 5 seconds...,5000,special://home/addons/script.xvbmc.update/icon.png)"
 
sleep 1
reboot