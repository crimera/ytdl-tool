link='https://youtu.be/b-BsFT7FWLE'

while [ -n "$1" ]; do # while loop starts

	case "$1" in

	-m)

		thumb='true'
		echo hi

	;;

	-clip)

	    if [ -z $url ]; then

	    	url=$2

			echo $2 $3 $4 $5

        	ffmpeg -i "$(youtube-dl -f best --get-url $2)" -ss $3 -to $4 -c:v copy -c:a copy $5.mp4
			
        else

        	ffmpeg "$(youtube-dl -f best --get-url $url)" -ss $2 -to $3 -i -c:v copy -c:a copy $4.mp4

        fi
	shift
    ;;

	-title)
	    test -z $url
	    if (($? == 1)) then

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