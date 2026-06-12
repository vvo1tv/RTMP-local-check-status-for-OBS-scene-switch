1: curl -s "URL_САЙТА" | findstr /i "active" || start "RTMP_idle" & exit
Timeout /t 1
Goto 1