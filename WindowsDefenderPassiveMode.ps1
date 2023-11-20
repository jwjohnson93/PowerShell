# This script enables Periodic Scanning (Passive Mode) for Windows Defender, which allows for Defender Signature Definition updates.

# Define registry path and values
$defenderRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows Defender"
$wdBootRegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\WdBoot"
$wdFilterRegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\WdFilter"
$winDefendRegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\WinDefend"

# Set the values
Set-ItemProperty -Path $defenderRegistryPath -Name "DisableAntiSpyware" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $defenderRegistryPath -Name "DisableAntiVirus" -Value 0 -Type DWord -Force
Set-ItemProperty -Path $defenderRegistryPath -Name "PassiveMode" -Value 2 -Type DWord -Force

Set-ItemProperty -Path $wdBootRegistryPath -Name "Group" -Value "Early-Launch" -Type String -Force
Set-ItemProperty -Path $wdBootRegistryPath -Name "Start" -Value 0 -Type DWord -Force

Set-ItemProperty -Path $wdFilterRegistryPath -Name "Start" -Value 0 -Type DWord -Force

Set-ItemProperty -Path $winDefendRegistryPath -Name "Start" -Value 2 -Type DWord -Force