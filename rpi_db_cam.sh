#!/bin/bash

#Variablen setzen
backup_dir="/home/user01/Bilder/db/"
target_dir="/media/homes/Bilder/00-PICAM-DB/"
check_file="check.datei"
#Datum setzen
datum=`date +%Y-%m-%d-%H%M`00.jpg

#Pr√ºfung, ob das Zielverzeichnis existiert, wenn ja dann evenutelle
#vorhandene Bilder aus dem Backupverzeichnis ins Zielverzeichnis verschieben

if [ -f $target_dir$check_file ]; then
#wenn das Zielverzeichnis vorhanden ist
#dann werden eventuelle Datei aus dem Backupordner
# in das Zielverzeichnis verschoben 
sudo mv $backup_dir* $target_dir > /dev/null 2>&1 
#bitte recht freundlich, Speicherung im Server Zielverzeichnis 
sudo raspistill --brightness 50 --exposure verylong --awb auto -o $target_dir$datum

else
#wenn das Hauptzielverzeichnis nicht verf√gbar ist, dann in Backupverzeichnis
sudo raspistill --brightness 50 --exposure verylong --awb auto -o $backup_dir$datum

fi
