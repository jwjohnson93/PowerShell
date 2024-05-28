$Productkey = (Get-WmiObject -Class SoftwareLicensingService).OA3xOriginalProductkey

cscript /b C:\Windows\System32\slmgr.vbs -ipk $Productkey

cscript /b C:\Windows\System32\slmgr.vbs -ato