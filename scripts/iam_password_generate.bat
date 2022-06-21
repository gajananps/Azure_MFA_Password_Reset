@echo off
setlocal enabledelayedexpansion
set "currentpath=%cd%"
set "pre_path=%~dp0.."
echo inprogress > "%pre_path%"\logs\status.log


powershell write-host -fore Cyan Azure Portal IAM Password Generation - Inprogress ...


rem script sxecution
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -File "C:\Apache24\htdocs\azure-dashboard\scripts\iam_password_generate.ps1" "%pre_path%">> "%pre_path%\logs\pass_generator_action.log" 2>&1
if "%errorlevel%" == "0" (
echo Password generated successfully. >>"%pre_path%\logs\error.log"
echo Password generated successfully.>> "%pre_path%\logs\info.log"
echo success >"%pre_path%\logs\status.log"
) else (
echo Failed to generate the password. Please see the error log for more details >>"%pre_path%\logs\error.log"
echo Failed to generate the password. Please see the error log for more details >> "%pre_path%\logs\info.log"
echo failed >"%pre_path%\logs\status.log" 
goto :end )

cls
echo.
echo.
powershell write-host -fore Cyan Azure Portal IAM Password Generation - Completed.


:end