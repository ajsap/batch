:: attachVhds original script v1.0
:: https://github.com/ajsap/batch/tree/master/attachVhds
:: Installed on 14/08/2018 by: andy.s@madcat.co.nz
:: taskschd: "Mount DATA.vhdx" runs at system startup
:: whether a user is logged in or not, by SYSTEM.
diskpart /s "C:\Scripts\attachVhds\attachData.txt"
