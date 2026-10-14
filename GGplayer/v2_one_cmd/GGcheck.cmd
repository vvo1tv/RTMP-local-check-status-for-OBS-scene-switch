set i=1
:checkGG 
timeout /t 10
curl -k -s https://goodgame.ru/vintalin > curlGG.txt 
findstr "images/ico_tv.png" curlGG.txt || goto live
goto %i%
:2
taskkill /fi "WINDOWTITLE eq LIVE"
tasklist /fi "WINDOWTITLE eq idle" | find "cmd.exe"
echo error level = %ERRORLEVEL%
if ERRORLEVEL 1 start "idle"
:1
goto checkGG

:live
REM extendet pause before 1st live
if %i% GTR 1 goto i2
timeout /t 7
set i=2
:i2
timeout /t 1
taskkill /fi "WINDOWTITLE eq idle"
REM check open window - open it if not exist
tasklist /fi "WINDOWTITLE eq LIVE" | find "cmd.exe"
echo error level = %ERRORLEVEL%
if ERRORLEVEL 1 start "LIVE"
goto checkGG
exit /b

:idle

exit

description

::1: curl -s "URL_САЙТА" | findstr /i "active" && start "RTMP_active" & exit
:: %~dp0 - полный путь до bat-файла

https://curl.se/docs/manpage.html
-s silent mode - без служебной информации

-k — отключает проверку SSL‑сертификата (небезопасно в продакшене).
--ssl-no-revoke — явно отключает проверку отзыва сертификата (актуально для Windows + schannel).

https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cmd
|| - Выполняет вторую команду (справа от оператора), только если первая завершилась с ошибкой (вернула ненулевой код выхода) 
&& - Выполняет вторую команду, только если первая прошла успешно (код выхода равен 0)

tasklist /fi "WINDOWTITLE eq LIVE" && 