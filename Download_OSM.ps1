param(
  # tested or latest version of JOSM?
  [parameter(Mandatory=$true)]
  [ValidateSet("tested", "latest")]
  [string]$josm = "tested"
)

$url = "https://josm.openstreetmap.de/download/josm-{0}.jar" -f $josm
$output = [Environment]::GetFolderPath("Desktop") + "\josm-{0}.jar" -f $josm
$start_time = Get-Date

echo $output

Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

java.exe -Xmx3950M -classpath "$output;C:\Data\jython2.5.3\jython.jar" org.openstreetmap.josm.gui.MainApplication
