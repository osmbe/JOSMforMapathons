#!/bin/bash

configfolder="$HOME/.config/JOSM"
localsharefolder="$HOME/.local/share/JOSM"

mkdir -p $localsharefolder/plugins

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
output=~"/Desktop/$josmjar"
echo $output
wget -N $url -P ~/Desktop/
#chmod +x $output

pluginfolder=$localsharefolder/plugins

echo $pluginfolder
wget -nd "https://drive.google.com/uc?export=download&id=1JgBV-_6R79gxTqcraHia_nW5WwrEJcrF" -O "pt_assistant.jar"
mv pt_assistant.jar "$pluginfolder"

java -Xmx1950M -classpath "/home/jo/Desktop/josm-latest.jar" org.openstreetmap.josm.gui.MainApplication
sleep 1h
