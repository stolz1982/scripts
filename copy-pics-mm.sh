#/bin/bash
TARGET="/home/user01/MagicMirror/modules/MMM-ImageSlideshow/exampleImages"
SOURCE="/media/homes/Bilder/00-PICAM-DB"

copypics()
{
	YMD=$1
	echo "copypics: $YMD"
	/bin/cp $SOURCE/$YMD* $TARGET > /dev/null 2>&1
}

#delete pic in target dir
/bin/rm $TARGET/*.jpg 

for year in {1..25} ; do
	YMD=`/bin/date +%Y-%m-%d`
	YMD=$(/bin/date -d "$YMD -$year years" +%Y-%m-%d)
	copypics $YMD
done

#convert(add filename) pics in target dir
for f in $TARGET/* ; do
	name=`/usr/bin/basename $f`
	#text postition starting right vertical, right horizontal
	mogrify -font helvetica -fill red -pointsize 125 -draw "text 20,100 '$name'" $f
done

#restart of MagicMirror
/usr/bin/pm2 restart magicmirror-startup-script
