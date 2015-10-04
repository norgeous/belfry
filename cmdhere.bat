@ECHO off

TITLE CMD
COLOR 0A

SET "_drive=%~d0"
SET "_parent=%~dp0"
SET "_parent=%_parent:~0,-1%"
SET "PATH=%PATH%;%_parent%"
PUSHD "%_parent%"
CLS & ECHO.

CMD

POPD
EXIT /B 0