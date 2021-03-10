# Command Test 
ffmpeg -i video.mp4 -i image.png -map 1 -map 0 -c copy -disposition:0 attached_pic out.mp4