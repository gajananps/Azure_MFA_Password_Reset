@echo off
setlocal enabledelayedexpansion
set "currentpath=%cd%"
set "pre_path=%~dp0.."
del "%pre_path%\logs\error.log" "%pre_path%\logs\info.log" "%pre_path%\logs\status.log" >nul
echo inprogress > "%pre_path%"\logs\info.log
echo inprogress > "%pre_path%"\logs\status.log

C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -File "C:\Apache24\htdocs\azure-dashboard\scripts\azure_login.ps1" "%pre_path%" >> "%pre_path%\logs\login_action.log" 2>&1
if "%errorlevel%" == "0" (
TYPE "%pre_path%\logs\login_action.log"
echo successfully Login with Azure surper user >>"%pre_path%\logs\error.log"
echo successfully Login with Azure surper user  > "%pre_path%\logs\info.log"
) else (
echo Azure login Failed  >>"%pre_path%\logs\error.log"
echo Azure login Failed > "%pre_path%\logs\info.log"
echo failed >"%pre_path%\logs\status.log" 
goto :end )