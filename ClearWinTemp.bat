:: ================================== ::
:: Clear Windows Temp v1.0            ::
:: Created: 2017-12-15 | Andy Saputra ::
:: ================================== ::
:: It deletes everything that isn't   ::
:: in use, just skips those files     ::
:: that are in use. Schedule it daily ::
:: or can be as often as needed.      ::
:: ================================== ::
del C:\Windows\Temp /S /Q /F
del C:\Windows\Temp /S /Q /A:H
FOR /D %%p IN ("C:\Windows\Temp\*") DO rmdir "%%p" /s /q
