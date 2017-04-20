REM /D will make sure an existing configuration doesn't get replaced

xcopy /D preferences.xml %USERPROFILE%\AppData\Roaming\JOSM\

REM this CMD file is mostly needed to make sure the following Powershell script can be executed, regardless of execution policy

powershell -noexit -executionpolicy bypass -File .\Download_OSM.ps1 -josm tested
