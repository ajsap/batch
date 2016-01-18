:: TransactorTech: RepliCat v1.0 - A Simple Tomcat Replicator
:: Created: 2016-01-15 | Andy Saputra
:: E: andy.saputra@transactortech.com
:: ============================================================
:: 1> Changes to the file system on primary site will be -
:: -> automatically replicated to the DR site.
:: 2> 1-way folder syncronization script (pull method)
:: 3> schedule daily and run this script from DR site
:: ============================================================
:: Turning off the technical commands from the screen..
@echo off
::
echo Detaching any previous drive connected to T:
net use T: /D /YES
:: ============================================================
:: Make sure TCP+UDP 135-139 & 445 is opened on the primary !!
:: ============================================================
echo Connecting to GTW-Tomcat T: (Tomcat drive)
net use T: \\1.2.3.4\c$ /user:login password
::
echo Switching to T: (Remote / Master Tomcat drive)
T:
::
echo Changing directory to Tomcat
cd T:\src
::
echo Replicating Tomcat to DR Server (this server)
robocopy T:\src\ C:\dst /Z /E
::
exit
:: End of this batch file :)
