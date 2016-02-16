:: TransactorTech: ThorReports v1.0
:: Created: 2016-02-16 | Andy Saputra
:: E: andy.saputra@transactortech.com
:: ==============================================================
:: -> This batch file will process Thor reports in D:\ThorFiles
:: ==============================================================
:: 1> It will rename Thor reports from .TXT to .CSV
:: 2> Send them to manager@company.tld
:: 3> Archive sent reports in D:\ThorFiles\FarmersReportsArchived
:: ==============================================================
:: Turning off the technical commands from the screen..
@ECHO OFF

ECHO Sending Thor Reports
if exist D:\thorfiles\REP_*.txt CD /D D:\thorfiles 
if exist D:\thorfiles\REP_*.txt REN REP_*.txt REP_*.csv
::if exist D:\thorfiles\REP_*.csv C:\BLAT\BLAT.EXE -body "Reports attached." -server 1.2.3.4 -u administration@transactortech.com -pw passwd -f donotreply@transactortech.com -subject "Farmers Reports" -try 30 -to manager@company.tld -bcc andy.saputra@transactortech.com,reports@transactortech.com -attach D:\thorfiles\REP_*.csv
:: FOR TESTING, DISABLE MOVE PROCEDURE BELOW AND USE ::>
C:\BLAT\BLAT.EXE -body "[TEST] Reports attached." -server 1.2.3.4 -u administration@transactortech.com -pw passwd -f donotreply@transactortech.com -subject "Farmers Reports" -try 30 -to ursula.main@transactortech.com -bcc andy.saputra@transactortech.com,reports@transactortech.com -attach D:\thorfiles\REP_*.csv

if  %errorlevel% == 0 (
move D:\thorfiles\REP_*.csv D:\thorfiles\FarmersReportsArchived\
)
