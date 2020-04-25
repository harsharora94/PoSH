﻿# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  Name        		:	List-Firewall-Outbound-Ports-ProgramExceptions.ps1
#  Author      		:	Harsh Arora
#  Description     	:	This powershell script uses calculated properties to retrieve all firewall Outbound Ports with Program Exceptions with cmdlet Select-Object and export it to CSV format. 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$Logfile = "$env:SystemDrive\ListAllFirewallOutboundRules.log"
$ExportFirewallOutboundCSV = "$env:SystemDrive\AvailableFirewallOutboundRules.csv"

function LogWrite([string]$logstring)
{
	$DateTime = Get-Date -Format g
	Add-content $Logfile -value "$DateTime $logstring"
}

$Return = Get-NetFirewallRule -Direction Outbound | 
          Select-Object -Property DisplayName, 
          DisplayGroup, 
          Profile, 
          Enabled, 
          Action,
          @{Name='Program';Expression={($PSItem | Get-NetFirewallApplicationFilter).Program}},
          @{Name='LocalAddress';Expression={($PSItem | Get-NetFirewallAddressFilter).LocalAddress}},
          @{Name='RemoteAddress';Expression={($PSItem | Get-NetFirewallAddressFilter).RemoteAddress}},
          @{Name='Protocol';Expression={($PSItem | Get-NetFirewallPortFilter).Protocol}},
          @{Name='LocalPort';Expression={($PSItem | Get-NetFirewallPortFilter).LocalPort}},
          @{Name='RemotePort';Expression={($PSItem | Get-NetFirewallPortFilter).RemotePort}}| Export-CSV -NoType $ExportFirewallOutboundCSV

If($? -eq $true)
{
    LogWrite "Exporting of all Windows Firewall Outbound Rules with Port Numbers and Program Exceptions in CSV format at location: '$ExportFirewallOutboundCSV' and returned: $?" 
}
else
{
   LogWrite "Failed to export all Windows Firewall Outbound Rules with Port Numbers and Program Exceptions in CSV format at location: '$ExportFirewallOutboundCSV' and returned: $?" 
}