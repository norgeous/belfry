@ECHO off

TITLE GNU CoreUtils
COLOR 4F

SET "_drive=%~d0"
SET "_parent=%~dp0"
SET "_parent=%_parent:~0,-1%"
SET "PATH=%PATH%;%_parent%"
SET "PATH=%PATH%;C:\Program Files (x86)\GnuWin32\bin"
PUSHD "%_parent%"
CLS & ECHO.

ECHO %PATH% | tr ';' '\n'
ENV | tail -2
ECHO.

CMD

POPD
EXIT /B 0