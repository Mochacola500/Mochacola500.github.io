@echo off

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "Year=%dt:~0,4%" & set "Month=%dt:~4,2%" & set "Day=%dt:~6,2%"
set "Hour=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "YMSdatestamp=%Year%-%Month%-%Day%"
set "HMSdatestamp=%Hour%:%Min%:%Sec%"
set "filename=_posts/%YMSdatestamp%-.md"

echo Create %filename% file.
echo --- > %filename%
echo title: >> %filename%
echo date: %YMSdatestamp% %HMSdatestamp% +0900 >> %filename%
echo categories: >> %filename%
echo tags: >> %filename%
echo --- >> %filename%
pause