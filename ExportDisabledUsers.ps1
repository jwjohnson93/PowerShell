# Set the path for the CSV file (customize this)
$csvFilePath = "C:\temp\disabledusers_031124.csv"

# Search the OU "User Accounts" in the domain vzawireless.net for disabled users
$disabledUsers = Get-ADUser -Filter {Enabled -eq $False} -SearchBase "OU=Active Associates,OU=User Accounts,DC=vzawireless,DC=net" -Properties GivenName, Surname, UserPrincipalName, DistinguishedName

# Export the details of disabled users to the CSV file
$disabledUsers | Select-Object GivenName, Surname, UserPrincipalName, @{Name="OU"; Expression={$_.DistinguishedName -replace '^CN=.*?,OU=(.*?),DC=.*','$1'}} | Export-Csv -Path $csvFilePath -NoTypeInformation

# Display a message indicating successful export
Write-Host "User information exported to $csvFilePath"
