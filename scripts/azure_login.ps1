Param(
   [Parameter(Position=1)]
   [string]$WorkingDir
  )
 
az login --use-device-code
Start-Sleep -Seconds 10;
If ( $? )
        {
            Write-Host "successfully done the Azure login for super user"
            Add-Content -Path $WorkingDir\logs\error.log -Value "successfully done the Azure login for super user"
        } 
        Else 
        {
            Write-Host "Failed to login the Azure for super user.Provide the valid credentials and try again"
            Add-Content -Path $WorkingDir\logs\error.log -Value "Failed to login the Azure for super user.Provide the valid credentials and try again"
            Set-Content $WorkingDir\logs\info.log "Failed to login the Azure for super user.Provide the valid credentials and try again"
            Set-Content $WorkingDir\logs\status.log "failed"
            $out_put = ($error[0].ToString() + $error[0].InvocationInfo.PositionMessage)
            Write $out_put | Out-File $WorkingDir\logs\error.log -Append -encoding ASCII
            Write-Host "---------------------------------------------------------------------------------"
            Add-Content -Path $WorkingDir\logs\error.log -Value "---------------------------------------------------------------------------------"
            Exit
        }