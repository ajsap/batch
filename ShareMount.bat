::::::::::::::::::::::::::::::::::::::::::::
:: Simple Windows Share Mounter v1.1      ::
:: Can be scheduled to run on boot :)     ::
:: Created: 2016-01-26 | andy@saputra.org ::
::::::::::::::::::::::::::::::::::::::::::::

@ECHO OFF
ECHO Detaching all previously attached network shares..
NET USE S: /D /YES

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Make sure TCP+UDP 135-139 & 445 is opened on remote side. ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO Attaching network shares..
NET USE S: \\ip-or-address\share /user:Username Password

EXIT
