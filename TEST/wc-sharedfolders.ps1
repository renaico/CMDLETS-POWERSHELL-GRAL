get-WmiObject -class Win32_Share -computer localhost | Where-Object {$_.path} |Select-Object path | Export-Csv .\rutas.csv

Import-Csv .\rutas.csv -Header path | ForEach-Object {
    write-host "El recurso compartido $($_.path) tiene" (Get-ChildItem -Path $($_.path) -Recurse -Directory | Measure-Object).Count "carpetas" | Out-File .\resultado.txt -Append
    write-host "El recurso compartido $($_.path) tiene" (Get-ChildItem -Path $($_.path) -Recurse -File | Measure-Object).Count "archivos" | Out-File .\resultado.txt -Append
    write-host "El recurso compartido $($_.path) Ocupa" ("{0:N2} MB" -f ((Get-ChildItem -path $($_.path) -recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB)) "de espacio en disco" | Out-File .\resultado.txt -Append
}