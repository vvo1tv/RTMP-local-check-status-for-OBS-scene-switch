1: curl -s "URL_САЙТА" | findstr /i "active" && start "RTMP_active" & exit
Timeout /t 1
Goto 1