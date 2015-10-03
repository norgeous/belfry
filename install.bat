@ECHO off

TITLE Project installer
COLOR 0A

SET "_drive=%~d0"
SET "_parent=%~dp0"
SET "_parent=%_parent:~0,-1%"
SET "PATH=%PATH%;%_parent%"
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
PUSHD "%_parent%"

CLS & ECHO.

REM install chocolatey
WHERE /Q choco
IF %ERRORLEVEL% equ 0 (
	ECHO # chocolatey already installed
) ELSE (
	ECHO # installing chocolatey
	@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
)

IF EXIST "%_parent%\composer.json" (

	ECHO # processing composer dependencies in "%_parent%\composer.json"

	REM install php and vc redist for some dll
	SET "PATH=%PATH%;%windir:~0,2%\tools\php"
	WHERE /Q php
	IF %ERRORLEVEL% equ 0 (
		ECHO # php already installed
	) ELSE (
		ECHO # choco install vcredist2012 php
		choco install vcredist2012 php
	)

	REM get composer.phar
	IF EXIST "%_parent%\composer.phar" (
		ECHO # composer.phar already installed
	) ELSE (
		ECHO # getting composer.phar
		php -r "readfile('http://getcomposer.org/installer');" | php -- --disable-tls
	)
	
	REM download dependencies listed in composer.json
	ECHO # php composer.phar install
	php composer.phar install

)

IF EXIST "%_parent%\package.json" (

	ECHO # processing node dependencies in "%_parent%\package.json"

	REM install node
	WHERE /Q node
	IF %ERRORLEVEL% equ 0 (
		ECHO # node already installed
	) ELSE (
		ECHO # choco install nodejs
		choco install nodejs
	)

	REM download dependencies listed in package.json
	ECHO # npm install
	CALL npm install

)

ECHO. && PAUSE

POPD
EXIT /B 0