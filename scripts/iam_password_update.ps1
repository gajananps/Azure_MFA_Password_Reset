Param(
   [Parameter(Position=1)]
   [string]$WorkingDir
  )
  
  #Today's Date
$cdate = Get-Date -Format ddMMyyyy

$values = Get-Content $WorkingDir\input\send_mail.properties | Out-String | ConvertFrom-StringData
$sender = $values.sender_id
$sender_pwd = $values.sender_password
$cc_id = $values.cc_id
$title = $values.mail_subject

Write-Host "$sender, $sender_pwd, $cc_id, $title"

$MailingList = Import-Csv $WorkingDir\credential\IAM_User_Password.csv

#SMTP Server and port may differ for different email service provider
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

#Your email id and password
$SMTPUser = "$sender"
$SMTPPass = "$sender_pwd"


#Iterating data from CSV mailing list and sending email to each person
foreach ( $person in $MailingList)
{
    $iTeam =  $person.Team
    $iManagerEmailID =  $person.ManagerEmailID
    $iSenderName = $person.SenderName
    $iSenderEmailID =  $person.SenderEmailID
    $iNewPWD = $person.IAM_User_Password
    $iIAM_User_Email = $person.IAM_User_Email
    
    Write-Host "$iSenderName, $iSenderEmailID, $iManagerEmailID, $iTeam, $iNewPWD, $iIAM_User_Email"
    
#Password Reset
 Write-Host "---------------------------------------------------------------------------------"
az ad user update --id "$iIAM_User_Email" --force-change-password-next-sign-in false --password "$iNewPWD"
If ( $? )
{
   
    Write-Host "Successfully password has been updated for the user $iIAM_User_Email"
    Add-Content -Path $WorkingDir\logs\error.log -Value "Successfully updated the password for the user $iIAM_User_Email"
    Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
    if (Test-Path $WorkingDir\credential\$iSenderName.txt) {
        Remove-Item -Force $WorkingDir\credential\$iSenderName.txt | Out-Null 
    }
         Write-Host "---------------------------------------------------------------------------------"
        Set-Content $WorkingDir\credential\$iSenderName.txt "Password : $iNewPWD" -Force
        If ( $? )
        {
            
            Write-Host "Text file created successfully and updated the password for the user $iIAM_User_Email"
            Add-Content -Path $WorkingDir\logs\error.log -Value "Text file created successfully and updated the password for the user $iIAM_User_Email"
            Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
        } 
        Else 
        {
            Write-Host "Failed to create the text file for the user $iIAM_User_Email"
            Add-Content -Path $WorkingDir\logs\error.log -Value "Failed to create the text file for the user $iIAM_User_Email"
            Set-Content $WorkingDir\logs\info.log "Failed to create the text file for the user $iIAM_User_Email"
            Set-Content $WorkingDir\logs\status.log "failed"
            $out_put = ($error[0].ToString() + $error[0].InvocationInfo.PositionMessage)
            Write $out_put | Out-File $WorkingDir\logs\error.log -Append -encoding ASCII
            Write-Host "---------------------------------------------------------------------------------"
            Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
            az logout
            Exit
        }

    $to = $person.SenderEmailID
    $cc = $cc_id
    $bcc = $person.ManagerEmailID
    $subject = "$title"
    $body = @"  

Hi $iSenderName,

As per the earlier notification, we have changed the Cloud account credentials & domain for Azure. Please make a note of it and kindly share it with your team.  

Team : $iTeam
URL : https://portal.azure.com/
Username : $iIAM_User_Email
Password : $iNewPWD

Kindly ensure it from your end and please let us know if you have any concerns in logging in.

Regards,
Cloud Team
                            
"@    
$attachment = "$WorkingDir\credential\$iSenderName.txt"

    $message = New-Object System.Net.Mail.MailMessage
    $message.subject = $subject
    $message.body = $body
    $message.to.add($to)
    $message.cc.add($cc)
    $message.bcc.add($bcc)
    $message.from = $SMTPUser
    $message.attachments.add($attachment)

	$SMTPClient = New-Object System.Net.Mail.SmtpClient( $SMTPServer , $SMTPPort )
	$SMTPClient.EnableSsl = $True
	$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $SMTPUser , $SMTPPass );
     Write-Host "---------------------------------------------------------------------------------"
	$SMTPClient.Send( $message )
    If ( $? )
        {
            Write-Host "Updated password has been sent through mail to $iSenderName"
            Add-Content -Path $WorkingDir\logs\error.log -Value "Updated password has been sent through mail to $iSenderName"
            Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
        } 
        Else 
        {
            Write-Host "Sending mail has been failed for $iSenderName"
            Add-Content -Path $WorkingDir\logs\error.log -Value "Sending mail has been failed for $iSenderName"
            Set-Content $WorkingDir\logs\info.log "Sending mail has been failed for $iSenderName"
            Set-Content $WorkingDir\logs\status.log "failed"
            $out_put = ($error[0].ToString() + $error[0].InvocationInfo.PositionMessage)
            #Write $Error | Out-File $WorkingDir\logs\error.log -Append
            Write $out_put | Out-File $WorkingDir\logs\error.log -Append -encoding ASCII
            Write-Host "---------------------------------------------------------------------------------"
            Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
            #az logout
            Exit           
        }
}
Else 
{
    Write-Host "Failed to update the password for the user $iIAM_User_Email"
    Write-Host "Failed"
    Add-Content -Path $WorkingDir\logs\error.log -Value "Failed to update the password for the user $iIAM_User_Email"
    Set-Content $WorkingDir\logs\info.log "Failed to reset the password for the user $iIAM_User_Email"
    Set-Content $WorkingDir\logs\status.log "failed"
    $out_put = ($error[0].ToString() + $error[0].InvocationInfo.PositionMessage)
    #Write $Error | Out-File $WorkingDir\logs\error.log -Append
    Write $out_put | Out-File $WorkingDir\logs\error.log -Append -encoding ASCII
    Write-Host "---------------------------------------------------------------------------------"
    Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
    az logout
    Exit 
}
}
    Write-Host "Successfully reset the password for all the users in the csv file"
    Write-Host "Success"
    Add-Content -Path $WorkingDir\logs\error.log -Value "Successfully reset the password for all the users in the csv file"
    Set-Content $WorkingDir\logs\info.log "Successfully reset the password for all the users"
    Set-Content $WorkingDir\logs\status.log "success"
    az logout
    Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
    Exit