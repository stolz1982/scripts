#!/bin/bash
#zur Berechnung und Eintragung der Sonnenaufgang und Sonnenuntergang wird hdate verwendet
#sudo apt-get install hdate

#user01@RPI-OPENHAB:~/scripts $ hdate -t -l 52.520008 -L 13.404954 -z +1
#Saturday, 12 December 2020, 26 Kislev 5781
#first_light: 06:15
#talit: 06:50
#sunrise: 08:08
#midday: 12:00
#sunset: 15:52
#first_stars: 16:33
#three_stars: 16:52
#sun_hour: 00:38


#Definition der Input Parameter
#$1 - Richtung UP oder DOWN
#$2 - GerÃtetyp - SWITCH oder SHUTTER
#$3 - Peer ID aus Homegear

if [ "$2" == "SWITCH" ]
	then
		if [ "$1" == "UP" ]
			then
				/usr/bin/homegear -e rc "\$hg->setValue($3, 1, \"STATE\",\"c8\");"
			else
				/usr/bin/homegear -e rc "\$hg->setValue($3, 1, \"STATE\", 00);"
		fi		
	else
		if [ "$1" == "UP" ]
			then
				/usr/bin/homegear -e rc "\$hg->setValue($3, 1, \"LEVEL\", 1.0);"
			else
				/usr/bin/homegear -e rc "\$hg->setValue($3, 1, \"LEVEL\", 0.0);"
		fi		
fi
