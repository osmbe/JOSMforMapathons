param(
  # tested or latest version of JOSM?
  [parameter(Mandatory=$true)]
  [ValidateSet("tested", "latest")]
  [string]$josm = "tested"
)
$start_time = Get-Date
$url = "https://josm.openstreetmap.de/download/josm-{0}.jar" -f $josm
$output = [Environment]::GetFolderPath("Desktop") + "\josm-{0}.jar" -f $josm
$pluginfolder = [Environment]::GetFolderPath("UserProfile") + "\AppData\Roaming\JOSM\plugins"
$pluginsurl = "https://svn.openstreetmap.org/applications/editors/josm/dist/"

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output

mkdir -p "$pluginfolder"

ForEach ($plugin In "OpeningHoursEditor","RoadSigns","apache-commons","apache-http","buildings_tools","geochat","measurement","pt_assistant","tag2link","terracer","tofix","utilsplugin2","wikipedia" )
 {echo "$pluginsurl$plugin"
 Start-BitsTransfer -Source "$pluginsurl$plugin.jar" -Destination "$pluginfolder\$plugin.jar"}

(iwr https://github.com/JOSM/Mapillary/releases/download/v1.5.3/Mapillary.jar).Content >"$pluginfolder\Mapillary.jar"
(iwr http://developer.skobbler.com/public/openstreetcam/OpenStreetCam.jar).Content >"$pluginfolder\OpenStreetCam.jar"
(iwr https://raw.githubusercontent.com/Gubaer/josm-scripting-plugin/deploy/dist/scripting.jar).Content >"$pluginfolder\scripting.jar"
(iwr https://github.com/JOSM/todo/releases/download/v30100/todo.jar).Content >"$pluginfolder\todo.jar"

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

java.exe -Xmx3950M -classpath "$output;C:\Data\jython2.5.3\jython.jar" org.openstreetmap.josm.gui.MainApplication
