# --------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  Name        		:	List-All-Windows-Services.ps1
#  Author      		:	Harsh Arora
#  Description     	:	This powershell script uses Get-WmiObject to retrieve all services, which are instances of the Win32_Service Class and export it to CSV format. 
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------

$Logfile = "$env:SystemDrive\ListAllWindowsServices.log"
$ExportServicesCSV = "$env:SystemDrive\AvailableWindowsServices.csv"

function LogWrite([string]$logstring)
{
	$DateTime = Get-Date -Format g
	Add-content $Logfile -value "$DateTime $logstring"
}

$Return = Get-WMIObject Win32_Service | Select-Object DisplayName, Description, State, StartMode, StartName, PathName

If($? -eq $true)
{
   Get-WMIObject Win32_Service | Select-Object DisplayName, Description, State, StartMode, StartName, PathName | Export-CSV -NoType $ExportServicesCSV
   LogWrite "Exporting of all Windows Services using Get-WmiObject in CSV format at location: '$ExportServicesCSV' and returned: $?" 
}
else
{
   LogWrite "Failed to export all Windows Services using Get-WmiObject in CSV format at location: '$ExportServicesCSV' and returned: $?" 
}