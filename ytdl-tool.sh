# Request for the video url
echo "Paste Video Url"
url_test=https://youtu.be/2xx_2XNxxfA
read vid_url

# Getting the timestamps
echo 'Clip Start From [__:00:00]'
read start_hrs
echo 'Clip Start From [00:__:00]'
read start_mins
echo 'Clip Start From [00:00:__]'
read start_secs
ffmpeg -i "$(youtube-dl -f 137+140 --get-url $url_test)" -ss $from -to $to -c:v copy -c:a copy out.mp3

ffmpeg -i $(youtube-dl -f best --get-url 'https://youtu.be/RUecxcEGyCM') -ss 00:00:00 -to 00:00:10 -c:v copy -c:a copy out3.mp4