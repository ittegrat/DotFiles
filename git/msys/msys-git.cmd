@echo off

if [%1]==[] goto GitOnly

:: MSVC/PDG Setup
if [%1]==[x86] set PDG_ADDRESS_MODEL=x86
if [%1]==[amd64] set PDG_ADDRESS_MODEL=amd64

if [%2]==[vs2008] set VS_VER=9
if [%2]==[vs2012] set VS_VER=11
if [%2]==[vs2015] set VS_VER=14

set PDG_COMPILER_VERSION=vc%VS_VER%

call "C:\Program Files (x86)\Microsoft Visual Studio %VS_VER%.0\VC\vcvarsall.bat" %PDG_ADDRESS_MODEL%

set PATH=%PATH%;C:\Program Files\7-Zip

:: Disable some msys2's path conversions (http://sourceforge.net/p/msys2/wiki/Porting/)
:: -F should catch all the cl -Fo -Fd -Fi etc. flags
set MSYS2_ARG_CONV_EXCL=-Fd;-Fo

:GitOnly
set GitRoot=%~dp0PortableGit
set HOME=%USERPROFILE%\home
::start /b %GitRoot%\git-bash.exe --cd-to-home
start %GitRoot%\git-bash.exe --cd-to-home
