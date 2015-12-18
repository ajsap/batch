:: TransactorTech: DA Cleanup v1.1
:: Created: 2015-12-15 | Andy Saputra
:: E: andy.saputra@transactortech.com
:: ============================================================
:: Will cleanup *.txt & *.7z older than 21 days on %tgt_maint%
:: To use, simply set path to 'tgt_maint' variables below:
:: ============================================================
:: Turning off the technical commands from the screen..
@echo off
:: DON'T FORGET TO SET VARIABLES BELOW ::
set tgt_maint1=F:\DWHS\orignalFile
set tgt_maint2=F:\DWHS\uploaded
:: ============================================================
:: Don't touch codes below unless you know what you're doing !!
:: ============================================================
forfiles /P %tgt_maint1% /S /M *.txt /D -21 -C "cmd /c del @path"
forfiles /P %tgt_maint1% /S /M *.7z /D -21 -C "cmd /c del @path"
forfiles /P %tgt_maint2% /S /M *.txt /D -21 -C "cmd /c del @path"
forfiles /P %tgt_maint2% /S /M *.7z /D -21 -C "cmd /c del @path"
:: Undefining variables..
set target_maint1=
set target_maint2=
::
exit
:: End of this batch file :)
