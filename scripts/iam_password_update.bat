@echo off
setlocal enabledelayedexpansion
set "currentpath=%cd%"
set "pre_path=%~dp0.."
echo inprogress > "%pre_path%"\logs\status.log

rem PowerShell.exe -Command "%pre_path%"\script\2_azure_password_reset.ps1 "%pre_path%" >> "%pre_path%\logs\pass_reset_action.log" 2>&1
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -File "C:\Apache24\htdocs\azure-dashboard\scripts\iam_password_update.ps1" "%pre_path%" >> "%pre_path%\logs\pass_reset_action.log" 2>&1
if "%errorlevel%" == "0" (
TYPE "%pre_path%\logs\pass_reset_action.log"
echo Password reset successfully >>"%pre_path%\logs\error.log"
echo Password reset successfully > "%pre_path%\logs\info.log"
) else (
TYPE "%pre_path%\logs\pass_reset_action.log"
echo Failed to reset the password. Please see the error log for more details >>"%pre_path%\logs\error.log"
echo Failed to reset the password. Please see the error log for more details > "%pre_path%\logs\info.log"
echo failed >"%pre_path%\logs\status.log" 
goto :end )

:end