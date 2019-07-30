@echo off
Rem ## First Step ##
rem 	Set remote server infomation 
rem include 'server ip address' 'ftp user&passwd'
set ServerIP=192.168.43.200
set FtpUserName=sopho
set FtpUserPasswd=123456789

rem ## Second Setp ## 
rem 	Get file name from keyboard input
rem used for a file to save upload infomation
set /p FileName="Please input your unique ID:"

rem ## Third Step ##
rem get the Information we need,and saved into the file 
wmic bios get SerialNumber > %FileName%.txt

rem ## Fourth Step ##
rem Generate a file which include the cmd used for FTP
echo open %ServerIP%> ftpcmd.bat
echo %FtpUserName%>> ftpcmd.bat
echo %FtpUserPasswd%>> ftpcmd.bat
echo put %FileName%.txt>> ftpcmd.bat
echo bye>> ftpcmd.bat

rem ## Fifth Step ##
rem Upload the file to Ftp server
ftp -s:ftpcmd.bat

rem ## Sixth Step ##
rem Pause to Check the result
pause

rem ## Seventh Step ##
rem Delete the file generated in this process
del ftpcmd.bat
del %FileName%.txt