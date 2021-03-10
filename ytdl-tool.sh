link='https://youtu.be/b-BsFT7FWLE'

while [ -n "$1" ]; do # while loop starts

	case "$1" in

	# Clip option
	-clip)

	    if [ -z $url ]; then # Check if the url is already set

	    	url=$2 #Sets the url

			echo $2 $3 $4 $5

        	ffmpeg -i "$(youtube-dl -f best --get-url $2)" -ss $3 -to $4 -c:v copy -c:a copy $5.mp4
			
        else

        	ffmpeg "$(youtube-dl -f best --get-url $url)" -ss $2 -to $3 -i -c:v copy -c:a copy $4.mp4

        fi

    ;;

	-audio)

		if [ -z  $url ]; then

			url=$2
			title=$(youtube-dl --get-title $2)
			youtube-dl -f bestaudio $2 -o "%(title)s.%(ext)s"

			youtube-dl $2 --write-thumbnail --skip-download -o "$title.%(ext)s"

			ffmpeg -i "$title.webp" "$title.jpg"

			mkvextract "$title.webm" tracks 0:"$title.opus"

			kid3-cli -c "set picture:'$title.jpg' 'Thumbnail'" "$title.opus"

			rm "$title.webm"
			rm "$title.webp"
			rm "$title.jpg"
		
		fi

	shift
	;;
	
	-music)

		if [ -z $url ]; then
			
			url=$2

			youtube-dl -f bestaudio[ext=m4a] $2 --embed-thumbnail --add-metadata
		
		else 
		 	youtube-dl -f bestaudio[ext=m4a] $url --embed-thumbnail --add-metadata
		fi
		
	shift
	;;

	-title) # Gets the title of the video 
	
	    if [ test -z $url ]; then

	    	url=$2
			youtube-dl --get-title $2

		else

  			youtube-dl --get-title $url

		fi
	shift
	;;
		
	--)
	shift # The double dash makes them parameters

	break
	;;
		
	esac

	shift

done

total=1

for param in "$@"; do

	echo "#$total: $param"

	total=$(($total + 1))

done 
