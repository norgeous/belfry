@ECHO OFF

REM install chocolatey
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

REM composer dependencies
if exist composer.json (

	REM install php
	choco install php

	REM get composer.phar
	php -r "readfile('https://getcomposer.org/installer');" | php
	
	REM download dependencies listed in composer.json
	php composer.phar install

)

REM node dependencies
if exist package.json (
	
	REM install node
	choco install node

	REM download dependencies listed in package.json
	npm install

)