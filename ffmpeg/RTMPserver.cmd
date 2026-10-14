:1
"C:\ffmpeg\bin\ffmpeg.exe" -listen 1 -i rtmp://192.168.8.100/live -c:v libx264 -c:a aac -f flv rtmp://live.twitch.tv/app/live_[acount_num]
timeout /t 2
goto 1
exit

::not working 
rem "C:\ffmpeg\bin\ffmpeg.exe" -re -f flv -listen 1 -i rtmp://192.168.8.100/live -c copy rtmp://live.twitch.tv/app/live_[acount_num]
rem "C:\ffmpeg\bin\ffmpeg.exe" -f flv -listen 1 -i rtmp://192.168.8.100/live -c copy rtmp://live.twitch.tv/app/live_[acount_num]
rem "C:\ffmpeg\bin\ffmpeg.exe" -f flv -listen 1 -i rtmp://192.168.8.100/live -c copy srt://192.168.8.100:10000
rem "C:\ffmpeg\bin\ffmpeg.exe" -f flv -listen 1 -i rtmp://localhost:1935/live/app -c copy srt://localhost:10000
