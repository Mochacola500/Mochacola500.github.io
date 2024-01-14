@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%" & set "MS=%dt:~15,3%"
set "datestamp=%YYYY%-%MM%-%DD%"
set "hmsdatestamp=%HH%:%Min%:%Sec%"

echo --- >> %datestamp%-.md
echo title: >> %datestamp%-.md
echo date: %datestamp% %hmsdatestamp% +0900 >> %datestamp%-.md
echo categories: >> %datestamp%-.md
echo tags: >> %datestamp%-.md
echo --- >> %datestamp%-.md
pause