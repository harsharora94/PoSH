# ---------------------------------------------------------------------------------------------------------------------------------
#  Name        		:	Remove-Firewall-Group-Rules.ps1
#  Author      		:	Harsh Arora
#  Description     	:	This powershell script removes either Windows Firewall Inbound or Outbound Group Rules which will be passed
#                       as a command-line argument using powershell cmdlets
#  Arguments       	:	$GroupName, $Direction
# ---------------------------------------------------------------------------------------------------------------------------------

$GroupName = $args[0]
$Direction = $args[1]
$Logfile = "$env:SystemDrive\RemoveFirewallGroupRule.log"
$ExportFirewallGroupRules = "$env:SystemDrive\ListFirewallGroupRules.csv"
$PSFirewallGroupRule = Get-NetFirewallRule -DisplayGroup "$GroupName" -Direction $Direction | Export-Csv -NoTypeInformation $ExportFirewallGroupRules

function LogWrite([string]$logstring)
{
	$DateTime = Get-Date -Format g
	Add-content $Logfile -value "$DateTime $logstring"
}

LogWrite "Searching Windows Firewall Group Rule Name : '$GroupName' in direction: '$Direction'" 

#Delete all the matching Firewall Group Rules 
If($GroupName -ne $null)
{
    $PSFirewallGroupRule
    $Return = Get-NetFirewallRule -DisplayGroup "$GroupName" -Direction $Direction | Remove-NetFirewallRule

    If ($? -eq $false)
    {        
        LogWrite "Not found, so can't delete all the matching Firewall Group Rule Name: '$GroupName' from Direction: '$Direction' and returned: $?"        
    }
    else 
    {
        LogWrite "Found, so deleting all the matching Firewall Group Rule Name: '$GroupName' from Direction: '$Direction' and returned: $?"
    }
} 