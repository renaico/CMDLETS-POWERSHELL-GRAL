[xml]$CustomView = @"
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-Audio/CaptureMonitor">
    <Select Path="Microsoft-Windows-Audio/CaptureMonitor">*[System[Provider[@Name='Microsoft-Windows-Audio'] and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]</Select>
    <Select Path="Microsoft-Windows-Audio/GlitchDetection">*[System[Provider[@Name='Microsoft-Windows-Audio'] and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]</Select>
    <Select Path="Microsoft-Windows-Audio/Informational">*[System[Provider[@Name='Microsoft-Windows-Audio'] and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]</Select>
    <Select Path="Microsoft-Windows-Audio/Operational">*[System[Provider[@Name='Microsoft-Windows-Audio'] and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]</Select>
    <Select Path="Microsoft-Windows-Audio/PlaybackManager">*[System[Provider[@Name='Microsoft-Windows-Audio'] and (Level=1  or Level=2 or Level=3 or Level=4 or Level=0 or Level=5)]]</Select>
  </Query>
</QueryList>
"@

Get-WinEvent -FilterXML $CustomView | Export-CSV "C:\CustomView_$(Get-Date -format "yyyy-MM-DD").log"