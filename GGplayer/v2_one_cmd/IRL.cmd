rem @ECHO OFF

tasklist /fi "IMAGENAME eq AnyDesk.exe" | find /i "AnyDesk.exe"
if errorlevel 1 start "" /min "C:\distr\_portable\AnyDesk.exe"
tasklist /fi "IMAGENAME eq rudesktop.exe" | find /i "rudesktop.exe"
rem if errorlevel 1 start "" /min "C:\Program Files\RuDesktop\rudesktop.exe"
if errorlevel 1 start "" /min "C:\distr\_portable\rudesktop-3.0.1563-x32.exe"

set TimeM=4
set /p TimeM="Time lag (press [Enter] for %TimeM%) minutes: "
set /a TimeS=%TimeM%*60

timeout /t %TimeS%

start "pre2"
timeout /t 10
taskkill /fi "WINDOWTITLE eq pre2"
start "GGcheck" GGcheck.cmd
exit

:: description

https://stackoverflow.com/questions/1869155/math-on-batch-win
set /a (any arithmatic)
set /a 2+2 adding
set /a 2-2 subtracting
set /a 2*2 multiplying
set /a 2/2 deviding
set /a 2^2 exponet