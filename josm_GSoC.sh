#!/bin/bash

configfolder="$HOME/.config/JOSM"
josmjarfolder="$HOME/Desktop"

preferences=$configfolder/preferences.xml
if [ ! -f $preferences ]; then
    wget https://raw.githubusercontent.com/osmbe/JOSMforMapathons/master/preferences.xml -P $configfolder
fi
if [ $# -eq 0 ]; then
    josmjar="josm-latest.jar"
else
    josmjar="josm-$#.jar"
fi

echo $josmjar

url="https://josm.openstreetmap.de/download/$josmjar"
echo $url
output="$josmjarfolder/$josmjar"
echo $output
wget -N $url -P "$josmjarfolder/"
#chmod +x $output

java -Xmx1950M -classpath "$josmjarfolder/$josmjar" org.openstreetmap.josm.gui.MainApplication --load-preferences="./josm_GSoC_preferences_mod.xml"
sleep 1h
