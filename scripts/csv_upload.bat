@echo off
echo.
echo.
@Echo CSV Upload - Progress
echo.
echo.
@Echo Copy files to Query folder - Progress
cd\
cd C:\Apache24\htdocs\azure-dashboard\input
copy IAM_User_Password.csv C:\sql_query
echo.
echo.

cd\
cd C:\Apache24\htdocs\azure-dashboard\sql_query
copy 1_azure_password.sql C:\sql_query
echo.
echo.

copy 2_admin_table.sql C:\sql_query
echo.
echo.

copy 3_color_setting.sql C:\sql_query
echo.
echo.


copy csv_file_import.sql C:\sql_query
echo.
echo.

copy csv_mysql_import.bat C:\sql_query
echo.
echo.


@Echo 6 files copied.