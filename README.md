# PoSH
Powershell scripts 


# How To Display Firewall Inbound/Outbound Rules With Port Numbers & Program Exceptions
Displaying firewall Inbound/Outbound rules with PowerShell is very easy with the Get-NetFirewallRule cmdlet.
However, there is a gap: port numbers are not displayed.

With the use of calculated properties, Wirewall Firewall Inbound/Outbound Rules with Port Numbers & Program Exceptions can be displayed everything in a single output. Several cmdlets like the Select-Object or the Format-Table cmdlets can be used.
