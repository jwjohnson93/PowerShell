# Define the path to the CSV file containing the object IDs
$csvFilePath = "C:\temp\m365-delete.csv"

# Import the CSV file
$groupObjectIds = Import-Csv -Path $csvFilePath

# Connect to Azure AD
Connect-AzureAD

# Iterate through each object ID and delete the corresponding group
foreach ($groupObjectId in $groupObjectIds) {
    $groupId = $groupObjectId.GroupObjectId
    Remove-AzureADGroup -ObjectId $groupId
    Write-Host "Group with Object ID $groupId deleted."
}
