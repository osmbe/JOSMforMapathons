xcopy /D preferences.xml %USERPROFILE%\AppData\Roaming\JOSM\


powershell -noexit -executionpolicy bypass -File .\Download_OSM.ps1 -josm tested
