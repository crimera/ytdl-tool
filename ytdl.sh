#!/bin/bash

url=$1
echo "What should I do with $url ?"
echo "a) download youtube audio to Music Folder"
echo "r) download youtube audio in ASMR Folder"
echo "u) download youtube video to Movies Folder"
echo "x) cancel"

read CHOICE
case $CHOICE in
  a)
    youtube-dl -f bestaudio[ext=m4a] $url -o "storage/music/%(title)s.%(ext)s" --embed-thumbnail --add-metadata
	;;
  r)
    youtube-dl -f bestaudio[ext=m4a] $url -o "storage/shared/ASMR/[%(upload_date)s] %(title)s [%(channel)s] - %(id)s.m4a" --embed-thumbnail --add-metadata
	;;
  x)
    echo "bye"
	;; 
esac