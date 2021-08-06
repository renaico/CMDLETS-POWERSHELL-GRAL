

##CALENDARIOS
Get-Mailbox -ResultSize Unlimited | ForEach {Get-MailboxFolderPermission -Identity "$($_.PrimarySMTPAddress):\Calendar" } | Where-Object {$_.User.DisplayName -ne "Default" -and $_.User.DisplayName -ne "Anonymous"} | Select Identity,User,AccessRights | Export-Csv -path .\CALENDARSperms.csv


#BUZONES







#ForEach ($user in (Get-Mailbox -ResultSize:Unlimited)) { Get-MailboxFolderPermission -Identity "$($user.Alias):\calendar" | Select *,@{'Name'='Mailbox';'Expression'={$user.Alias}}} 