#!/bin/bash

#Variablen setzen
TARGET_DIR="/media/homes/Bilder/00-PICAM-DB"
CHECK_FILE="check.datei"
MOUNT_DIR="/media/homes"

if [ -f $TARGET_DIR/$CHECK_FILE ]; then
	
	/bin/echo "$TARGET_DIR/$CHECK_FILE exists"

else
	
	/bin/echo "$TARGET_DIR/$CHECK_FILE does not exist, trying to mount"
	/bin/mount $MOUNT_DIR

fi
