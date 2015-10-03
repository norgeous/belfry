@ECHO off

if "%~1"=="" (
	REM no param supplied, start interactive powershell
	PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass' -Verb RunAs}";
) else (
	REM param must be full path to file.ps1
	PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%1""' -Verb RunAs}";
)