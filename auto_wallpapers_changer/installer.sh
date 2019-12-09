#!/bin/bash

SERVC_FILE=wallpapers_changer.service
SERVC_FILEPATH=~/.config/systemd/user/

if [ "$1" == "install" ];then
	if [ ! -f $SERVC_FILE$SERVC_FILEPATH ]; then
	    cp $SERVC_FILE $SERVC_FILEPATH
	fi
	systemctl --user daemon-reload
	systemctl --user enable $SERVC_FILE
	systemctl --user start $SERVC_FILE

elif [ "$1" == "remove" ];then
	systemctl --user stop $SERVC_FILE
	systemctl --user disable $SERVC_FILE
	if [ -e "$SERVC_FILEPATH$SERVC_FILE" ]; then
	    rm $SERVC_FILEPATH$SERVC_FILE
	fi
else
	echo "Error.Undefine argument. Argument should be install or remove"
fi

