#!/bin/bash

configfolder= eval `~/.config/JOSM`

mkdir -p $configfolder/plugins

preferences=$configfolder/preferences.xml
if [ ! -f $preferences ]; then
    wget https://raw.githubusercontent.com/osmbe/JOSMforMapathons/master/preferences.xml -P $configfolder
fi
if [ $# -eq 0 ]; then
    josmjar="josm-tested.jar"
else
    josmjar="josm-$#.jar"
fi

url="https://josm.openstreetmap.de/download/$josmjar"
output=`~/Desktop/$josmjar`
wget -N $url -P ~/Desktop/
chmod +x $output

pluginfolder=$configfolder/plugins
pluginsurl="https://svn.openstreetmap.org/applications/editors/josm/dist/"

for plugin in OpeningHoursEditor RoadSigns apache-commons apache-http buildings_tools geochat measurement pt_assistant tag2link terracer tofix utilsplugin2 wikipedia
do
    echo "$pluginsurl$plugin"
    wget -nd -N "$pluginsurl$plugin.jar" -P "$pluginfolder"
done

wget -nd -N https://github.com/JOSM/Mapillary/releases/download/v1.5.3/Mapillary.jar -P "$pluginfolder"
wget -nd -N http://developer.skobbler.com/public/openstreetcam/OpenStreetCam.jar -P "$pluginfolder"
#wget -nd -N https://raw.githubusercontent.com/Gubaer/josm-scripting-plugin/deploy/dist/scripting.jar -P "$pluginfolder"
#wget -nd -N https://github.com/JOSM/todo/releases/download/v30100/todo.jar -P "$pluginfolder"

java -Xmx3950M -classpath "$output;jython.jar" org.openstreetmap.josm.gui.MainApplication
