@echo off
bitsadmin /transfer mydownloadjob /download /priority FOREGROUND "https://raw.githubusercontent.com/foxcat-test/website/main/Discord.zip" "%cd%\Discord.zip"

setlocal

cd /d %~dp0


Call :UnZipFile "C:\Program Files (x86)\" "%cd%\Discord.zip"


exit /b


:UnZipFile <ExtractTo> <newzipfile>

set vbs="%temp%\_.vbs"

if exist %vbs% del /f /q %vbs%

>>%vbs% echo Set fso = CreateObject("Scripting.FileSystemObject")

>>%vbs% echo If NOT fso.FolderExists(%1) Then

>>%vbs% echo fso.CreateFolder(%1)

>>%vbs% echo End If

>>%vbs% echo set objShell = CreateObject("Shell.Application")

>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items

>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)

>>%vbs% echo Set fso = Nothing

>>%vbs% echo Set objShell = Nothing

cscript //nologo %vbs%


if exist %vbs% del /f /q %vbs%






set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Discord.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Program Files (x86)\Discord\Discord.exe" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%


set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%AppData%\Microsoft\Windows\Start Menu\Programs\Discord.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Program Files (x86)\Discord\Discord.exe" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%@echo off


REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discord" /v "UninstallString" /t REG_SZ /d "C:\Program Files (x86)\Discord\uninst000.bat"

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discord" /v "DisplayName" /t REG_SZ /d "Discord"

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discord" /v Publisher" /t REG_DWORD /d "foxcat"

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discord" /v NoModify" /t REG_DWORD /d 1

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discord" /v NoRepair" /t REG_DWORD /d 1
