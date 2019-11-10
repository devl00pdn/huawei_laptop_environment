#!/bin/bash

XRANDR_FILE=xrandr_huawei_plus_hp_config.sh
XRANDR_FILEPATH=~/.screenlayout/
EXEC_FILE=check_display_connected.py
EXEC_FILEPATH=/usr/local/bin/
SERVC_FILE=check_display_connected.service
SERVC_FILEPATH=/etc/systemd/system/

if [ "$1" == "install" ]
then
	mkdir -p ~/.screenlayout
	if [ ! -f $XRANDR_FILEPATH$XRANDR_FILE ]; then
	    cp $XRANDR_FILE $XRANDR_FILEPATH
	fi
	if [ ! -f $EXEC_FILE$EXEC_FILEPATH ]; then
	    cp $EXEC_FILE $EXEC_FILEPATH
	fi
	if [ ! -f $SERVC_FILE$SERVC_FILEPATH ]; then
	    cp $SERVC_FILE $SERVC_FILEPATH
	fi
	systemctl daemon-reload
	systemctl enable $SERVC_FILE
	systemctl start $SERVC_FILE

elif [ "$1" == "remove" ]
then
	systemctl stop $SERVC_FILE
	systemctl disable $SERVC_FILE
	if [ -e "$XRANDR_FILEPATH$XRANDR_FILE" ]; then
	    rm $XRANDR_FILEPATH$XRANDR_FILE
	fi
	if [ -e "$EXEC_FILEPATH$EXEC_FILE" ]; then
	    rm $EXEC_FILEPATH$EXEC_FILE
	fi
	if [ -e "$SERVC_FILEPATH$SERVC_FILE" ]; then
	    rm $SERVC_FILEPATH$SERVC_FILE
	fi

else
	echo "Error.Undefine argument. Argument should be install or remove"
fi



