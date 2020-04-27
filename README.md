# PoSH
Useful Powershell scripts 


# How To Display Firewall Inbound/Outbound Rules With Port Numbers & Program Exceptions
Displaying firewall Inbound/Outbound rules with PowerShell is very easy with the Get-NetFirewallRule cmdlet.
However, there is a gap: port numbers are not displayed.

With the use of calculated properties, Wirewall Firewall Inbound/Outbound Rules with Port Numbers & Program Exceptions can be displayed everything in a single output. Several cmdlets like the Select-Object or the Format-Table cmdlets can be used.

# Summarize table with all the Important Powershell Cmdlets:
[Get-NetIPInterface](https://docs.microsoft.com/en-us/powershell/module/nettcpip/get-netipinterface?view=win10-ps) | Shows you the available network interfaces. Can pass parameters to filter the results (e.g. only the DHCP assigned ones). |
--- | --- |
[Get-NetIPAddress](https://docs.microsoft.com/en-us/powershell/module/nettcpip/get-netipaddress?view=win10-ps) | Shows you the IP addresses. Again, can filter using parameters. |
[Set-NetIPInterface](https://docs.microsoft.com/en-us/powershell/module/nettcpip/set-netipinterface?view=win10-ps) | Change an interface settings. Such as turn off/ on DHCP, IPv6 neighbor discovery settings, router settings (advertising, packet forwarding), and Wake on LAN. |
[New-NetIPAddress](https://docs.microsoft.com/en-us/powershell/module/nettcpip/new-netipaddress?view=win10-ps) | Assign a new IP address to an interface. Use the –DefaultGateway switch to specify the default gateway. |
[Remove-NetIPAddress](https://docs.microsoft.com/en-us/powershell/module/nettcpip/remove-netipaddress?view=win10-ps) | Remove an assigned IP address from an interface. |
[Set-NetIPAddress](https://docs.microsoft.com/en-us/powershell/module/nettcpip/set-netipaddress?view=win10-ps) | Change IP address properties. For instance: change the subnet mask. |
[Rename-NetAdapter](https://docs.microsoft.com/en-us/powershell/module/netadapter/rename-netadapter?view=win10-ps) | Rename a network adapter. |
[Disable-NetAdapter](https://docs.microsoft.com/en-us/powershell/module/netadapter/Disable-NetAdapter?view=win10-ps) | Disable a network adapter. To enable use Enable-NetAdapter. |
[Get-NetAdapterBinding](https://docs.microsoft.com/en-us/powershell/module/netadapter/Get-NetAdapterBinding?view=win10-ps) | View the network adapter bindings. Such as IPv4, IPv6, Client for Microsoft Networks. |
[Disable-NetAdapterBinding](https://docs.microsoft.com/en-us/powershell/module/netadapter/Disable-NetAdapterBinding?view=win10-ps) | Disable network adapter bindings. To enable use Enable-NetAdapterBinding. |
[Get-NetRoute](https://docs.microsoft.com/en-us/powershell/module/nettcpip/Get-NetRoute?view=win10-ps) | View the routing table. |
[New-NetRoute](https://docs.microsoft.com/en-us/powershell/module/nettcpip/New-NetRoute?view=win10-ps) | Add an entry to the routing table. Use destination prefix as 0.0.0.0/0 (for IPv4) or ::/0 (for IPv6) to set default gateway. |
[Remove-NetRoute](https://docs.microsoft.com/en-us/powershell/module/nettcpip/remove-netroute?view=win10-ps) | Remove a routing table entry. |
[Get-DnsClient](https://docs.microsoft.com/en-us/powershell/module/dnsclient/Get-DnsClient?view=win10-ps) | View the DNS client settings. Such as DNS suffix, search list and so on. |
[Get-DnsClientServerAddress](https://docs.microsoft.com/en-us/powershell/module/dnsclient/get-dnsclientserveraddress?view=win10-ps) | View the DNS client server addresses. |
[Set-DnsClient](https://docs.microsoft.com/en-us/powershell/module/dnsclient/set-dnsclient?view=win10-ps) | Modify the DNS client settings. |
[Set-DnsClientServerAddress](https://docs.microsoft.com/en-us/powershell/module/dnsclient/set-dnsclientserveraddress?view=win10-ps) | Add DNS client server addresses. Put multiple address as (“x.x.x.x”, “x.x.x.x.”, …"). Use the -ResetServerAddressesswitch to remove the server addresses |
