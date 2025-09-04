@echo off
echo Installing MySQL Server...

REM Set paths
set MYSQL_SOURCE=C:\Users\vires\Downloads\mysql-8.0.43-winx64
set MYSQL_DEST=C:\mysql
set DATA_DIR=C:\mysql\data

REM Copy MySQL files to C:\mysql
if not exist "%MYSQL_DEST%" (
    echo Copying MySQL files...
    xcopy "%MYSQL_SOURCE%" "%MYSQL_DEST%\" /E /I /H /Y
    copy "my.ini" "%MYSQL_DEST%\my.ini"
) else (
    echo MySQL directory already exists.
)

REM Initialize data directory
if not exist "%DATA_DIR%" (
    echo Initializing MySQL data directory...
    "%MYSQL_DEST%\bin\mysqld" --initialize-insecure
) else (
    echo Data directory already exists.
)

REM Install MySQL service
echo Installing MySQL service...
"%MYSQL_DEST%\bin\mysqld" --install MySQL --defaults-file="%MYSQL_DEST%\my.ini"

REM Start MySQL service
echo Starting MySQL service...
net start MySQL

REM Wait for service to start
timeout /t 5 /nobreak > nul

REM Set root password and create database
echo Setting up database...
"%MYSQL_DEST%\bin\mysql" -u root --skip-password -e "
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;
SOURCE C:/Users/vires/Desktop/E-Commerce-Order-Management-System-main/backend/ecommerce_schema.sql;
SOURCE C:/Users/vires/Desktop/E-Commerce-Order-Management-System-main/backend/sample_data.sql;
"

echo MySQL installation and setup complete!
echo Root password: password
echo Database: ecommerce_db
pause
