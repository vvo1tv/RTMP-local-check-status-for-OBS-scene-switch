::CD %~dp0
::pause
:checkGG 
timeout /t 10
curl -s https://goodgame.ru/vintalin > curlGG.txt 
::pause
findstr "https://goodgame.ru/images/ico_tv.png" curlGG.txt || goto live
taskkill /fi "WINDOWTITLE eq LIVE"
tasklist /fi "WINDOWTITLE eq idle" | find "cmd.exe"
echo error level = %ERRORLEVEL%
if ERRORLEVEL 1 start "idle"
goto checkGG

:live
taskkill /fi "WINDOWTITLE eq idle"
tasklist /fi "WINDOWTITLE eq LIVE" | find "cmd.exe"
echo error level = %ERRORLEVEL%
if ERRORLEVEL 1 start "LIVE"
goto checkGG
exit /b

:idle

exit

::1: curl -s "URL_САЙТА" | findstr /i "active" && start "RTMP_active" & exit
:: %~dp0 - полный путь до bat-файла

https://curl.se/docs/manpage.html
-s silent mode - без служебной информации

https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cmd
|| - Выполняет вторую команду (справа от оператора), только если первая завершилась с ошибкой (вернула ненулевой код выхода) 
&& - Выполняет вторую команду, только если первая прошла успешно (код выхода равен 0)

tasklist /fi "WINDOWTITLE eq LIVE" && 