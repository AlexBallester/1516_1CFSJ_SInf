#!/bin/bash

# Script to convert all video files from a directory (parameter) into mp4 format file

# Sanity checks ?

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
<<<<<<< HEAD
while read videofiles
do
	lengthname=${#videofiles}
	namefile=${videofiles:0:$lengthname-4}
	filepath=$directory"/"$namefile
=======
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

>>>>>>> 673cd42aac22f3cf8bb8840550c0fc340e663f77

# existe fichero
if [ -f $filepath".mp4" ]
	then
	echo $namefile".mp4 ya existe, no se creara este archivo."
else

	mencoder $videofiles -o $namefile".mp4" -oac mp3lame -ovc lavc
fi
done < videofiles


while read videofiles
do
	lengthname=${#videofiles}

<<<<<<< HEAD
# existe fichero
if [ -f $filepath".mp3" ]
	then
	echo ${videofiles:0:$lengthname-4}".mp3 ya existe, no se creara este archivo."
else

	mplayer -vo null -dumpaudio -dumpfile ${videofiles:0:$lengthname-4}".mp3" $videofiles
fi
done < videofiles

rm videofiles
exit 0
=======
#done < videofiles
#rm videofiles
>>>>>>> 673cd42aac22f3cf8bb8840550c0fc340e663f77
