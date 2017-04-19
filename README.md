# JOSMforMapathons
An easy install script for JOSM, preconfigured with some nice plugins

JOSM_tested.cmd will copy JOSM's configuration file to the proper folder

and then invoke a powershell script.

the Powershell script downloads JOSM_tested.jar or JOSM_latest.jar depending on a parameter

and launches it with a setting to make sure it has enough memory available.

Download as ZIP, unzip in its own folder and then double click  on JOSM_tested.cmd

=====

If you put the cmd file on a network folder which uses an UNC path, you'll have to adapt it:

net use X: \\UNC_PATH_TO_NETWORK_SHARE\JOSM_OpenStreetMapEditor

X:
