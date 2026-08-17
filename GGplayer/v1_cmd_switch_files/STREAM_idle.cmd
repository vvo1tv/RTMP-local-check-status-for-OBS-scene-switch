::CD %~dp0
::pause
:1 
curl -s https://goodgame.ru/vintalin > temp.txt 
::pause
findstr "https://goodgame.ru/images/ico_tv.png" temp.txt || start "STREAM_active" STREAM_active.cmd && exit
timeout /t 10
goto 1

::1: curl -s "URL_САЙТА" | findstr /i "active" && start "RTMP_active" & exit
:: %~dp0 - полный путь до bat-файла

-s silent mode - без служебной информации (https://curl.se/docs/manpage.html)