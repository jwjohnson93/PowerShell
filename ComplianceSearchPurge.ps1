# Prompt user to input the name of Compliance search that needs to be purged
$SearchName = Read-Host -Prompt "Enter the name of the Compliance search to be purged"
$PurgeName = $SearchName + "_Purge"

#Connect to Security & Compliance
Connect-IPPSSession -UseRPSSession:$false

# Run a Search Action to Purge Emails
New-ComplianceSearchAction -SearchName "$SearchName" -Purge -PurgeType SoftDelete

# Check on the status of Purge
Get-ComplianceSearchAction -Identity $PurgeName | Format-List