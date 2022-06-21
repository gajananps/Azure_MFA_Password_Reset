@echo off
echo.
echo.
@Echo CSV Upload - Progress
echo.
echo.
@Echo Copy files to Query folder - Progress
cd\
cd C:\Apache24\htdocs\azure-dashboard\credential
copy IAM_User_Password.csv  C:\sql_query
echo.
echo.



cd\
cd C:\Apache24\htdocs\azure-dashboard\scripts
copy csv_pwd_import.bat C:\sql_query
echo.
echo.

copy mysql_query_pwd_execute.bat C:\sql_query
echo.
echo.

@Echo 3 file copied.