#!/bin/bash
# Set them to empty is NOT SECURE but avoid them display in random logs.
export VNC_PASSWD=''
export USER_PASSWD=''
export HTTP_AUTH_USER=''
export HTTP_AUTH_PASSWD=''

export DBUS_SESSION_BUS_ADDRESS=$(cat /var/run/dbus/DBUS_SESSION_BUS_ADDRESS)
export TERM=linux
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=fcitx

xdg-mime default xfe.desktop inode/directory
stalonetray --dockapp-mode simple &

while true; do
	echo "[APPDaemon] Starting APP ...."
	sudo HOME="$HOME" DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS"  /opt/baidunetdisk/baidunetdisk --no-sandbox &
	echo "[APPDaemon] Started APP ."
	wait $!
	echo "[APPDaemon] APP exited, auto start after 3 seconds ..."
	sleep 3
done
