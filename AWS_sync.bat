:: TransactorTech: AWS Uploader v0.7-RC
:: Created: 2016-05-25 | Andy Saputra
:: E: andy.saputra@transactortech.com
:: ============================================================
:: Will upload local source folder to target S3 bucket
:: Deletes them upon successful actions
:: To use, simply set variables below:
:: ============================================================
:: This script REQUIRES AWSCLI installed on default location
:: i.e. "C:\Program Files\Amazon\AWSCLI" as well as C:\BLAT\
:: Make sure to do 'aws configure' prior using this script -
:: for the first time, the configuration should be similar to:
:: AWS Access Key ID [****************SLEA]:
:: AWS Secret Access Key [****************t92T]:
:: Default region name [ap-southeast-2]:
:: Default output format [None]:
:: ============================================================
:: Turning off the technical commands from the screen..
@echo off
:: DON'T FORGET TO SET VARIABLES BELOW ::
set src_server=SVR-name
set src_folder=E:\test
set tgt_s3buck=logarchive-test
set tgt_s3fold=test
:: ============================================================
:: Don't touch codes below unless you know what you're doing !!
:: ============================================================
cd /D "C:\Program Files\Amazon\AWSCLI"
AWS.EXE s3 sync %src_folder% s3://%tgt_s3buck%/%tgt_s3fold%
:: unless "--delete" is not given, all it does only uploads.
if errorlevel 0 goto :cleanup
echo [INFO] We have a problem..
C:\BLAT\blat.exe -body "We have failed to sync %src_folder% to s3://%tgt_s3buck%/%tgt_s3fold%." -u user -pw password -server smtp-host.domain.tld -f sender@domain.tld -subject "[%src_server%] AWS Sync error" -try 30 -to "recipients@domain.tld"
goto :exit
:cleanup
echo [INFO] All done, no fatal errors, performing clean up on %src_folder%..
echo del /s /q %src_folder%
::
:exit
set src_server=
set src_folder=
set tgt_s3buck=
set tgt_s3fold=
exit
:: Variables Undefined..
:: End of this batch file :)
