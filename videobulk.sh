#!/bin/bash

# Script to convert all video files from a directory (parameter) into mp4 format file

# Sanity checks ?
# ...

# Main code

ls -1 $1*.avi > videofiles

while videofile
do
	lengthname=${#videofile}
	namefile=${videofile;0;$lengthname-4}
	mencoder $videofile -o namefile.mp4 -oac mp3lame -ovc lavc -of mp4

done < videofiles
rm videofiles
