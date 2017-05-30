#!/bin/bash

configfolder="$HOME/.config/JOSM"

mkdir -p "$configfolder/plugins"

preferences="$configfolder/preferences.xml"
if [ ! -f $preferences ]; then
    wget https://raw.githubusercontent.com/osmbe/JOSMforMapathons/master/preferences.xml -P $configfolder
fi
if [ $# -eq 0 ]; then
    josmjar="josm-tested.jar"
else
    josmjar="josm-$#.jar"
fi

url="https://josm.openstreetmap.de/download/$josmjar"
output="$HOME/Desktop/$josmjar"
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

java -jar $output
