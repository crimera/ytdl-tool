while [ -n "$1" ]; do # while loop starts

	case "$1" in

	-a) echo "-a option passed" ;;

	-b)
		param="$2"

		echo "-b option passed, with value $param"

		shift
		;;

	-c) echo "-c option passed" ;;

	--)
		shift # The double dash makes them parameters

		break
		;;

	*) echo "Option $1 not recognized" ;;

	esac

	shift

done

total=1

for param in "$@"; do

	echo "#$total: $param"

	total=$(($total + 1))

done

# Request for the video url
#echo "Paste Video Url"
#url_test=https://youtu.be/2xx_2XNxxfA
#read vid_url

# Getting the timestamps
#echo 'Clip Start From [__:00:00]'
#read start_hrs
#echo 'Clip Start From [00:__:00]'
#read start_mins
#echo 'Clip Start From [00:00:__]'
#read start_secs

#echo 'Clip Ends To [__:00:00]'
#read end_hrs
#echo 'Clip Ends To [00:__:00]'
#read end_mins
#echo 'Clip Ends To [00:00:__]'
#read end_secs

# Merge the timestamps
#from=$start_hrs:$start_mins:$start_secs
#to=$end_hrs:$end_mins:$end_secs

#ffmpeg -ss $from -to $to -i "$(youtube-dl -f best --get-url $url_test)" -c:v copy -c:a copy out.mp4

# ffmpeg -i $(youtube-dl -f best --get-url 'https://youtu.be/RUecxcEGyCM') -ss 00:00:00 -to 00:00:10 -c:v copy -c:a copy out3.mp4