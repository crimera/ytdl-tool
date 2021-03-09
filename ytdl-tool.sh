while [ -n "$1" ]; do # while loop starts

	case "$1" in

	-clip)
	    test -z $url
	    if [ $? == 0 ]
	    then
	    url=$2
        ffmpeg -ss $3 -to $4 -i "$(youtube-dl -f best --get-url $2)" -c:v copy -c:a copy $5.mp4
        else
        echo set
        fi
        ;;
        
	-title)
	    test -z $url
	    if [ $? == 0 ]
	    then
	    url=$2
		youtube-dl --get-title $2
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