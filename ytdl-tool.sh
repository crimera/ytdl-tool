while [ -n "$1" ]; do # while loop starts

	case "$1" in

	-clip) ffmpeg -ss $3 -to $4 -i "$(youtube-dl -f best --get-url $2)" -c:v copy -c:a copy $5.mp4 ;;

	-b)
		param="$2"

		echo "-b option passed, with value $param"

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