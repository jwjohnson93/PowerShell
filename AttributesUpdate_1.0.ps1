# Import Active Directory module
Import-Module ActiveDirectory

# Path to the CSV file
$csvPath = "C:\temp\addressbooks.csv"

try {
    # Read CSV file
    $csvData = Import-Csv $csvPath

    # Loop through each row in the CSV
    foreach ($row in $csvData) {
        # Retrieve data from the CSV row
        $jobTitle = $row.JobTitle
        $extensionAttribute6 = $row.extensionAttribute6
        $extensionAttribute1 = $row.extensionAttribute1
        
        try {
            # Search Active Directory for users with matching job title
            $users = Get-ADUser -Filter "title -eq '$jobTitle'" -SearchBase "OU=User Accounts,DC=vzawireless,DC=net" -SearchScope Subtree -ErrorAction Stop

            # Update attributes for each matching user
            foreach ($user in $users) {
                Set-ADUser -Identity $user -Replace @{extensionAttribute6 = $extensionAttribute6; extensionAttribute1 = $extensionAttribute1}
                Write-Host "Updated attributes for $($user.Name)"
            }
        } catch {
            Write-Host "Error occurred: $_"
            # Exit the script if an error occurs
        }
    }
} catch {
    Write-Host "Error occurred: $_"
}
