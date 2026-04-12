#!/bin/bash

# https://emvicy.com/2.x/installation
# requires
# - git
# - ddev
# - docker
#-----------------------------------------------------------------------------------------------------------------------
# usage
#     bash <(curl -s https://raw.githubusercontent.com/emvicy/Installers/refs/heads/main/Emvicy_2.x.sh
#-----------------------------------------------------------------------------------------------------------------------

clear;

read -p "Emvicy2 Project Name (alpha characters only): " -r

if [[ -z $REPLY ]]; then
    echo "You must at least enter a name for project.";
    echo "run this bash script this way:";
    echo -e "\tbash <(curl -s https://raw.githubusercontent.com/emvicy/Installers/refs/heads/main/Emvicy_2.x.sh);\n";
    echo -e "Abort.\n\n";
    exit;
fi;

# alpha only
if [[ $REPLY =~ [^[:alpha:]] ]]; then
    echo -e "The text contains non-alpha characters.\nAbort.\n\n";
    exit;
fi

# strtolower, ucfirst
sProjectName=${REPLY,,};
sProjectName=${sProjectName^};

xGit=`type -p git`;
xDdev=`type -p ddev`;

#-----------------------------------------------------------------------------------------------------------------------
echo "Project Name is: $sProjectName";
echo "Starting Installation Process.";

## clone emvicy
$xGit clone --branch 2.x https://github.com/Emvicy/Emvicy.git "$sProjectName";

## prepare ddev
cd "$sProjectName/";
$xDdev config --project-type=php --docroot=public --webserver-type=apache-fpm --php-version=8.5

# run ddev
cd "$sProjectName/";
$xDdev start;

## install a primary module named "$sProjectName"
$xDdev exec "php emvicy";
$xDdev exec "php emvicy module:add $sProjectName primary";
$xDdev exec "php emvicy";

#-----------------------------------------------------------------------------------------------------------------------
## install further modules

echo "install modules via git...";
cd modules/;

$xGit clone --branch 2.x https://github.com/emvicy/Email.git Email;
$xGit clone --branch 1.x https://github.com/emvicy/Idolon.git Idolon;
$xGit clone --branch 3.x https://github.com/emvicy/OpenApi.git OpenApi;
$xGit clone --branch 2.x https://github.com/emvicy/Paginator.git Paginator;
$xGit clone --branch 1.x https://github.com/emvicy/Phormix.git Phormix;
$xGit clone --branch 1.x https://github.com/emvicy/RouteDB.git RouteDB;
$xGit clone --branch 2.x https://github.com/emvicy/Ws.git Ws;

cd ../;
$xDdev exec "php emvicy";

#-----------------------------------------------------------------------------------------------------------------------
# done
$xDdev describe;