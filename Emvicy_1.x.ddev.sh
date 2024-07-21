#!/bin/bash

sAppName="Emvicy";
sBranch="1.x";

sAppDirName="$sAppName_$sBranch";
sModuleDir=`realpath "./modules/"`;
xPhp=`type -p php`;
xGit=`type -p git`;
sHere=`pwd`;

#------------------------------------------------------------

/usr/bin/clear;
$xGit clone --branch "$sBranch" https://github.com/Emvicy/Emvicy.git "$sAppDirName";

