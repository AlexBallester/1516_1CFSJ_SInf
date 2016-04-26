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

while read videofile
do
	lengthname=${#videofile}
	namefile=${videofile: -3}
	mencoder $videofile -o namefile.mp4 -oac mp3lame -ovc lavc

done < videofiles
rm videofiles