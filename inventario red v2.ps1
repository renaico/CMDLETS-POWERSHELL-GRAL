$computername = hostname

$origen = "$env:TEMP"

$destino = "\\192.168.10.110\shares\inventario_computadores"+'\'+$computername+'.csv' 

$direccion = (Resolve-DnsName -Type A $computername | Select-Object IPAddress | ft -HideTableHeaders)

Get-ComputerInfo | Select-Object WindowsProductName,WindowsRegisteredOrganization,WindowsRegisteredOwner,BiosBIOSVersion,BiosManufacturer,CsDNSHostName,CsDomain,CsDomainRole,CsManufacturer,CsModel,CsName,CsNumberOfLogicalProcessors,CsNumberOfProcessors,CsProcessors,CsPrimaryOwnerName,CsSystemFamily,CsSystemSKUNumber,CsSystemType,CsTotalPhysicalMemory,CsPhyicallyIns,talledMemory,CsUserName,CsWakeUpType,CsWorkgroup,OsName,OsHotFixes,OsBootDevice,OsSystemDevice,OsSystemDirectory,OsSystemDrive,OsWindowsDirectory,OsCountryCode,OsCurrentTimeZone,OsLocaleID,OsLocale,OsLocalDateTime,OsLastBootUpTime,OsUptime,OsTotalVisibleMemorySize,OsFreePhysicalMemory,OsTotalVirtualMemorySize,OsFreeVirtualMemory,OsInUseVirtualMemory,OsTotalSwapSpaceSize,OsSizeStoredInPagingFiles,OsFreeSpaceInPagingFiles,OsNumberOfUsers,OsOrganization,OsArchitecture,OsLanguage,OsProductSuites,OsProductType,OsRegisteredUser,OsSerialNumber,KeyboardLayout,TimeZone,LogonServer | Export-Csv -Path $origen\file.csv


$datos = (Import-Csv -Path $origen\file.csv -Delimiter ',' -Encoding Default)

foreach ($dato in $datos){
    Add-Member -InputObject $dato -MemberType NoteProperty -Name "IpAddress" -Value $direccion
}


Copy-Item -Path $origen\file.csv -Destination $destino -Force 