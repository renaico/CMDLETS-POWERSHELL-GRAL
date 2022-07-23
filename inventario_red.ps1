$computername = hostname

$origen = "%TEMP%"

#$destino = "\\192.168.10.110\shares\inventario_computadores"+'\'+$computername+'.csv'

$direccion = (Resolve-DnsName -Type A $computername | Select-Object IPAddress)

$computerinfo = (Get-ComputerInfo | Select-Object WindowsProductName,WindowsRegisteredOrganization,WindowsRegisteredOwner,BiosBIOSVersion,BiosManufacturer,CsDNSHostName,CsDomain,CsDomainRole,CsManufacturer,CsModel,CsName,CsNumberOfLogicalProcessors,CsNumberOfProcessors,CsProcessors,CsPrimaryOwnerName,CsSystemFamily,CsSystemSKUNumber,CsSystemType,CsTotalPhysicalMemory,CsPhyicallyIns,talledMemory,CsUserName,CsWakeUpType,CsWorkgroup,OsName,OsHotFixes,OsBootDevice,OsSystemDevice,OsSystemDirectory,OsSystemDrive,OsWindowsDirectory,OsCountryCode,OsCurrentTimeZone,OsLocaleID,OsLocale,OsLocalDateTime,OsLastBootUpTime,OsUptime,OsTotalVisibleMemorySize,OsFreePhysicalMemory,OsTotalVirtualMemorySize,OsFreeVirtualMemory,OsInUseVirtualMemory,OsTotalSwapSpaceSize,OsSizeStoredInPagingFiles,OsFreeSpaceInPagingFiles,OsNumberOfUsers,OsOrganization,OsArchitecture,OsLanguage,OsProductSuites,OsProductType,OsRegisteredUser,OsSerialNumber,KeyboardLayout,TimeZone,LogonServer)

#Copy-Item -Path $origen\*.* -Destination $destino -Force 

Write-Host $computerinfo + $direccion | Export-Csv -Path $origen\file.csv
