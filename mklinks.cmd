@echo off
setlocal

net session 1> NUL 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo Sorry, this batch requires elevated privileges.
  pause
  goto :eof
)

set HOSTNAME=%1
if [%HOSTNAME%]==[] set HOSTNAME=%COMPUTERNAME%

set here=%~dp0

pushd %here%..
call set basedir=%%here:%CD%\=%%

set srcdir=%basedir%msys2\dotfiles
call :create_link %srcdir%\.bashrc
call :create_link %srcdir%\.bash_profile
call :create_link %srcdir%\.inputrc
call :create_link %srcdir%\.minttyrc

set srcdir=%basedir%git\dotfiles
call :create_link %srcdir%\.gitconfig

popd

endlocal
goto :eof

:create_link
setlocal
if exist "%1.%COMPUTERNAME%" set target=%1.%COMPUTERNAME%
if _%target%_==__ (
  if exist "%1" set target=%1
)
if _%target%_==__ (
  echo [*ERROR*] File not found: %1
  exit /b
)
set link=%~nx1%
if exist "%link%" del "%link%"
mklink "%link%" "%target%"
exit /b
