#!/bin/bash

XRANDR_FILE=xrandr_huawei_plus_hp_config.sh
XRANDR_FILEPATH=~/.screenlayout/
EXEC_FILE=check_display_connected.py
EXEC_FILEPATH=/usr/bin/
SERVC_FILE=check_display_connected.service
SERVC_FILEPATH=~/.config/systemd/user/

if [ "$1" == "install" ];then
	mkdir -p ~/.screenlayout
	mkdir -p ~/.config
	mkdir -p ~/.config/systemd/
	mkdir -p ~/.config/systemd/user/
	if [ ! -f $XRANDR_FILEPATH$XRANDR_FILE ]; then
	    cp $XRANDR_FILE $XRANDR_FILEPATH
	fi
	if [ ! -f $EXEC_FILE$EXEC_FILEPATH ]; then
	    sudo cp $EXEC_FILE $EXEC_FILEPATH
	fi
	if [ ! -f $SERVC_FILE$SERVC_FILEPATH ]; then
	    cp $SERVC_FILE $SERVC_FILEPATH
	fi
	systemctl --user daemon-reload
	systemctl --user enable $SERVC_FILE
	systemctl --user start $SERVC_FILE

elif [ "$1" == "remove" ];then
	if [ -e "$XRANDR_FILEPATH$XRANDR_FILE" ]; then
	    rm $XRANDR_FILEPATH$XRANDR_FILE
	fi
	systemctl --user stop $SERVC_FILE
	systemctl --user disable $SERVC_FILE
	if [ -e "$EXEC_FILEPATH$EXEC_FILE" ]; then
	    sudo rm $EXEC_FILEPATH$EXEC_FILE
	fi
	if [ -e "$SERVC_FILEPATH$SERVC_FILE" ]; then
	    rm $SERVC_FILEPATH$SERVC_FILE
	fi

else
	echo "Error.Undefine argument. Argument should be install or remove"
fi



