
    # Habilitacion de la ejecucion de scripts
    set-executionpolicy remotesigned
    # La siguiente linea define los perfiles que nunca se eliminaran
    $ExcludedUsers ="Public","zenoss","svc","administrator","administrador"
    #Filtrado de Perfiles
    $LocalProfiles=Get-WMIObject -class Win32_UserProfile | Where {(!$_.Special) -and (!$_.Loaded) -and ($_.ConvertToDateTime($_.LastUseTime) -lt (Get-Date).AddDays(-1))}
    foreach ($LocalProfile in $LocalProfiles)
    {
    if (!($ExcludedUsers -like $LocalProfile.LocalPath.Replace("C:\Users\","")))
    {
    $LocalProfile | Remove-WmiObject
    Write-host $LocalProfile.LocalPath, "profile deleted" -ForegroundColor Magenta
    }
    } 