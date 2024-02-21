# After creating a Microsoft 365 group in Entra or Exchange Admin Center, this script will perform the following actions:
# 1. Update group's email address from the default onmicrosoft.com to the custom domain.
# 2. Hide the group from the GAL.
# 3. Disable the welcome email.
# 4. Hide the group from Outlook email clients.
# 5. Auto subscribe new members to emails and calendar events.

$groupName = "xxxxxx"
$groupEmail = "xxxxxxx@domain.com"

# Connect to Exchange Online
Connect-ExchangeOnline

# Set the M365 Group to subscribe members to messages/events, disable the welcome message, and hide from Exchange clients.
Set-UnifiedGroup -Identity $groupName -PrimarySmtpAddress $groupEmail -HiddenFromAddressListsEnabled: $false -UnifiedGroupWelcomeMessageEnable: $false -HiddenFromExchangeClientsEnabled: $false -AutoSubscribeNewMembers: $true

# Output results of the script
Get-UnifiedGroup -Identity $groupName | Format-List DisplayName, PrimarySmtpAddress, HiddenFromAddressListsEnabled, UnifiedGroupWelcomeMessageEnable, HiddenFromExchangeClientsEnabled, AutoSubscribeNewMemebers