#!/bin/bash
clear
curr_user=$(whoami)
echo "--- YouTube Downloader Script ---"
command -v youtube-dl >/dev/null 2>&1 || { echo >&2 "I require \"youtube-dl\" but it's not installed.  Aborting."; exit 1; }
echo -n "Enter YouTube Link and press [ENTER]:"
read url
if [ -z "$url" ]; then
	echo "You Need To Enter YouTube Link"
	exit
fi
title=$(sudo youtube-dl -e "$url")
file_path="/home/"
file_path="$file_path$curr_user/Desktop/YouTubeDownloads/%(title)s.%(ext)s"
echo "*** DOWNLOADING $title ***"

echo "Would You Like To Set Download Quality? [Y/N]"
read showformat
if [ -z "$showformat" ]; then
	echo "Downloading In Max Quality (Default)"
	sudo youtube-dl -o "$file_path" "$url"
else 
	if [ $showformat == "Y" || $showformat == "y" ]; then
		sudo youtube-dl -F "$url"
		echo -n "Choose Value Of Download Quality"
		read formatvalue
		sudo youtube-dl -o "$file_path" -i -f "$formatvalue" "$url"
	else
		if [ $showformat == "N" || $showformat == "n" ]; then
			echo "Downloading In Max Quality (Default)"
			sudo youtube-dl -o "$file_path" -i "$url"
		fi
	fi
fi
echo "FILE SAVED TO $file_path$curr_user/Desktop/YouTubeDownloads"
echo "*** FINISHED DOWNLOADS ***"

if [ $curr_user == "kanishka" ]; then
	cd /home/kanishka/Desktop/YouTubeDownloads/
	sudo cp *.* /media/ext_TV/Random\ Videos/
	cd /media/ext_TV/Random\ Videos/
	sudo chmod -R 777 *
	cd /home/kanishka/Desktop/YouTubeDownloads/
	sudo rm *
fi