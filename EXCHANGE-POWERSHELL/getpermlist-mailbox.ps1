

##CALENDARIOS
Get-Mailbox -ResultSize Unlimited | ForEach {Get-MailboxFolderPermission -Identity "$($_.PrimarySMTPAddress):\Calendar" } | Where-Object {$_.User.DisplayName -ne "Default" -and $_.User.DisplayName -ne "Anonymous"} | Select Identity,User,AccessRights | Export-Csv -path .\CALENDARSperms.csv


#BUZONES
Get-Mailbox -RecipientTypeDetails SharedMailbox,TeamMailbox,GroupMailbox,UserMailbox -ResultSize:Unlimited | Get-MailboxPermission | Select-Object Identity,User,AccessRights | Where-Object {($_.user -like '*@*')} | Export-Csv -Path .\mailboxperm.csv



#ForEach ($user in (Get-Mailbox -ResultSize:Unlimited)) { Get-MailboxFolderPermission -Identity "$($user.Alias):\calendar" | Select *,@{'Name'='Mailbox';'Expression'={$user.Alias}}} 