#!/bin/bash

sAppName="Emvicy";
sBranch="1.x";

sAppDirName="${sAppName}_${sBranch}";
sModuleDir=`realpath "./modules/"`;
xPhp=`type -p php`;
xGit=`type -p git`;
sHere=`pwd`;

#------------------------------------------------------------

/usr/bin/clear;
echo -e "\ninstalling...";
$xGit clone --branch "$sBranch" https://github.com/Emvicy/Emvicy.git "$sAppDirName";

cd "$sAppDirName";
$xPhp emvicy up;
cd "$sHere";

#------------------------------------------------------------
# install modules via git

echo "install modules via git...";
cd "$sModuleDir";

## myMVC_module_Captcha
#/usr/bin/git clone --branch 1.0.x \
#https://github.com/gueff/myMVC_module_Captcha.git \
#Captcha;

# Email
$xGit clone --branch 1.x \
https://github.com/Emvicy/Email.git \
Email;

#OpenApi;
$xGit clone --branch 1.x \
https://github.com/Emvicy/OpenApi.git \
OpenApi;

# Paginator
$xGit clone --branch 1.x \
https://github.com/Emvicy/Paginator.git \
Paginator;

cd "$sHere";

#------------------------------------------------------------
# done

cd "$sAppDirName";

$xPhp emvicy up;
$xPhp emvicy cc;
$xPhp emvicy dt;

cd "$sHere";
echo -e "installing complete.\n\n";