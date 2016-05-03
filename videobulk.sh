#!/bin/bash

# Script to convert all video files (.avi) from a directory into mp4 format file and mp3

# Sanity checks
#check if 
if [ $# -eq 0 ]
	then
	directory=$PWD
elif [ -d $1 ]
	then
	directory=$1
	else
		echo "sorry $1 is not a directory or a correct file" 
fi

# Main code

ls -1 $1*.avi > videofiles

#decir cuantos videos hay
numerofilesavi=$( cat videofiles |wc -l)
if [ $numerofilesavi -gt 0 ]
	then 
        echo "there are $numerofilesavi .avi files"
    fi

# conversion a mp4
while read videofiles
do
	lengthname=${#videofiles}
	namefile=${videofiles:0:$lengthname-4}
	filepath=$directory"/"$namefile
	# comprobacion de que ya exista el .mp4
	if [ -f $filepath".mp4" ]
		then
		echo $namefile".mp4 ya existe, no se creara este archivo."
	else
		#convertir a .mp4
		mencoder $videofiles -o $namefile".mp4" -oac mp3lame -ovc lavc
	fi
done < videofiles

#conversion a .mp3
while read videofiles
do
	lengthname=${#videofiles}
	# comprobacion de que ya exista el .mp3
	if [ -f $filepath".mp3" ]
		then
		echo ${videofiles:0:$lengthname-4}".mp3 ya existe, no se creara este archivo."
	else
		# convertir a .mp3
		mplayer -vo null -dumpaudio -dumpfile ${videofiles:0:$lengthname-4}".mp3" $videofiles
	fi
done < videofiles
exit 0