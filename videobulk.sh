#!/bin/bash

# Script to convert all video files from a directory (parameter) into mp4 format file

# Sanity checks ?
# ...

# Main code

if [ $# -eq 0 ]
	then
	directory=$PWD
elif [ -d $1 ]
	then
	directory=$1
	else
	echo "sorry $1 is not a directory" 

fi


ls -1 $1*.avi > videofiles
numerofilesavi=$( cat videofiles |wc -l)
if [ $numerofilesavi -gt 0 ]
	then 
        echo "there are $numerofilesavi of .avi files"

fi



while read videofile

do
length=${ #videofile }
name=${ videofile : 0 : length-3}
mplayer -vo null -dumpaudio -dumpfile $name".mp3" videofile

done


while read videofile
do
	lengthname=${#videofile}
	namefile=${videofile: -3}
	mencoder $videofile -o namefile.mp4 -oac mp3lame -ovc lavc

#done < videofiles
#rm videofiles