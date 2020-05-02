#/bin/bash
TARGET="/home/user01/MagicMirror/modules/MMM-ImageSlideshow/exampleImages"
SOURCE="/media/homes/Bilder/00-PICAM-DB"

copypics()
{
	YMD=$1
	echo "copypics: $YMD"
	/bin/cp $SOURCE/$YMD* $TARGET
}

#delete pic in target dir
/bin/rm $TARGET/*.jpg 

#pics 1 year before
YMD=`/bin/date +%Y-%m-%d`
YMD=$(/bin/date -d "$YMDi -1 year" +%Y-%m-%d)
copypics $YMD

#pics 3 years before
YMD=`/bin/date +%Y-%m-%d`
YMD=$(/bin/date -d "$YMD -3 years" +%Y-%m-%d)
copypics $YMD

#pics 5 years before
YMD=`/bin/date +%Y-%m-%d`
YMD=$(/bin/date -d "$YMD -5 years" +%Y-%m-%d)
copypics $YMD







#restart of MagicMirror
/usr/bin/pm2 restart magicmirror-startup-script



