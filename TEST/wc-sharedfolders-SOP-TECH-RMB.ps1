get-WmiObject -class Win32_Share -computer localhost | Where-Object {$_.path} | Select-Object path | Export-Csv -Path C:\Script\rutas.csv

Import-Csv C:\Script\rutas.csv -Header path | ForEach-Object {
    if ($_.path -ne "C:\" -and $_.path -ne "C:\Windows") {
        $resultado = ($($_.path) + "," + (Get-ChildItem -Path $($_.path) -Recurse -Directory | Measure-Object).Count + "," + (Get-ChildItem -Path $($_.path) -Recurse -File | Measure-Object).Count + "," + ("{0:N2} MB" -f ((Get-ChildItem -path $($_.path) -recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB))) 
    }   
} 

$importfile = (New-Item C:\Script\resultado.csv -ItemType file)

Add-Content $importfile "Ruta Compartida, Directorios, Archivos, MB Ocupados"

$resultado | Out-File -Append $importfile -Encoding utf8