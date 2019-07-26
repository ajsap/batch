:: Website Bandwidth Stress Test v1.0-BAT
:: Created: 2017-11-23 | Andy Saputra
:: https://saputra.org
:: --------------------------------------
:: GNU Wget for Windows can be downloaded
:: @ https://eternallybored.org/misc/wget
@echo off
set /a count=0
:start
cls
echo File has been downloaded %count% times!
echo.
wget -O NUL http://cachefly.cachefly.net/100mb.test
set /a count+=1
goto start
