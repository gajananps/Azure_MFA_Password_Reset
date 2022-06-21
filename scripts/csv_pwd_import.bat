@echo off
echo.
echo.
@Echo CSV Upload - Progress
echo.
echo.
cd\
cd  C:\sql_query



@Echo Delete MySQL Database - Progress
C:\tools\mysql\current\bin\mysql -u root -p"Corent@123" -e "drop database azureiamportaldb;"

echo.
echo.
@Echo Creating MySQL Database - Progress
C:\tools\mysql\current\bin\mysql -u root -p"Corent@123" -e "create database IF NOT EXISTS azureiamportaldb;"

echo.
echo.
@Echo Creating MySQL Azure Password Table - Progress
C:\tools\mysql\current\bin\mysql -u root -p"Corent@123" -e "use azureiamportaldb; source 1_azure_password.sql;"


echo.
echo.
@Echo Creating MySQL Azure Password Table - Progress
C:\tools\mysql\current\bin\mysql -u root -p"Corent@123" -e "use azureiamportaldb; source 2_admin_table.sql;"


echo.
echo.
@Echo Creating MySQL Azure Password Table - Progress
C:\tools\mysql\current\bin\mysql -u root -p"Corent@123" -e "use azureiamportaldb; source 3_color_setting.sql;"


echo.
echo.
@Echo Creating MySQL Azure Password Table - Progress
C:\tools\mysql\current\bin\mysql -u root -p"Corent@123" -e "use azureiamportaldb; source csv_file_import.sql;"


echo.
echo.
del passsword_Import.csv
echo.
echo.
@Echo  CSV File with password Retore completed