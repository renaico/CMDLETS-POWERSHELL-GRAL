<<<<<<< HEAD

    # Este Script Tiene como Finalidad elininar los perfiles cuyo ultimo login tiene un dia de antiguedad
    # Habilitacion de la ejecucion de scripts en la maquina
    set-executionpolicy remotesigned
    # La siguiente linea define los perfiles que nunca se eliminaran
    $ExcludedUsers ="Public","zenoss","svc","administrator","administrador"
    #Filtrado y eliminacion de los Perfiles 
    $LocalProfiles=Get-WMIObject -class Win32_UserProfile | Where {(!$_.Special) -and (!$_.Loaded) -and ($_.ConvertToDateTime($_.LastUseTime) -lt (Get-Date).AddDays(-1))}
    foreach ($LocalProfile in $LocalProfiles)
    {
    if (!($ExcludedUsers -like $LocalProfile.LocalPath.Replace("C:\Users\","")))
    {
    $LocalProfile | Remove-WmiObject
    Write-host $LocalProfile.LocalPath, "profile deleted" -ForegroundColor Magenta
    }
=======

    # Este Script Tiene como Finalidad elininar los perfiles cuyo ultimo login tiene un dia de antiguedad
    # Habilitacion de la ejecucion de scripts en la maquina
    set-executionpolicy remotesigned
    # La siguiente linea define los perfiles que nunca se eliminaran
    $ExcludedUsers ="Public","zenoss","svc","administrator","administrador"
    #Filtrado y eliminacion de los Perfiles 
    $LocalProfiles=Get-WMIObject -class Win32_UserProfile | Where {(!$_.Special) -and (!$_.Loaded) -and ($_.ConvertToDateTime($_.LastUseTime) -lt (Get-Date).AddDays(-1))}
    foreach ($LocalProfile in $LocalProfiles)
    {
    if (!($ExcludedUsers -like $LocalProfile.LocalPath.Replace("C:\Users\","")))
    {
    $LocalProfile | Remove-WmiObject
    Write-host $LocalProfile.LocalPath, "profile deleted" -ForegroundColor Magenta
    }
>>>>>>> 7b7df7a316a4da176f5533f1e7884eb1a1be8760
    } 