:: TransactorTech: LogSync v1.1
:: Created: 2013-12-04 | Sam Macleod
:: E: sam.macleod@transactortech.com
:: ============================================================
:: Updated: 2015-12-24 | Andy Saputra
:: E: andy.saputra@transactortech.com
:: Rewrote for Server => Server-DR ArchiveLogs Replication
:: Will replicate Archive Logs to DR Server
:: ============================================================
:: Turning off the technical commands from the screen..
@echo off
::
echo ALTER SYSTEM SWITCH LOGFILE..
call sqlplus lo/pw@db @C:\DRReplication\rotate_log.sql
::
echo Switching to J: (RMAN drive)
J:
::
echo Changing directory to LogArchive
cd J:\arch
::
echo Detaching any previous drive connected to R:
net use R: /D /YES
:: ============================================================
:: Make sure TCP+UDP 135-139 & 445 is opened on the DR site !!
:: ============================================================
echo Connecting to Server-DR J: (RMAN drive)
net use R: \\1.2.3.4\j$ /user:Administrator Password
::
echo Replicating Archive Logs to DR Server..
robocopy J:\arch\ R:\arch *.0001 /Z
::
exit
:: End of this batch file :)
