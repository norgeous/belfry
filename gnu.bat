@ECHO off

TITLE GNU CoreUtils
COLOR 4F

SET "_drive=%~d0"
SET "_parent=%~dp0"
SET "_parent=%_parent:~0,-1%"
PUSHD "%_parent%"
PATH %_parent%;C:\Program Files (x86)\GnuWin32\bin;%PATH%

CLS
ECHO %PATH% | tr ';' '\n'
ENV | tail -2
ECHO.

CMD

POPD
EXIT /B 0