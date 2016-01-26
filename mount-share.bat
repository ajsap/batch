::::::::::::::::::::::::::::::::::::::::
:: Simple Windows Share Mounter v1.0  ::
:: Can be scheduled to run on boot :) ::
:: Created: 2016-01-26 | andy@indo.fm ::
::::::::::::::::::::::::::::::::::::::::

@ECHO OFF
ECHO Detaching any previous drive connected to S:
NET USE S: /D /YES

ECHO Connecting to Samba S: drive..
NET USE S: \\ip-or-address\share /user:Username Password

EXIT
