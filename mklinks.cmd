@echo off
setlocal

set MACHINE=%1
if [%MACHINE%]==[] set MACHINE=%COMPUTERNAME%

cd /d %~dp0..\..

mklink .bashrc       DotFiles\git\dotfiles\.bashrc
mklink .bash_profile DotFiles\git\dotfiles\.bash_profile
mklink .gitconfig    DotFiles\git\dotfiles\.gitconfig
mklink .inputrc      DotFiles\git\dotfiles\.inputrc
mklink .minttyrc     DotFiles\git\dotfiles\.minttyrc.%MACHINE%

endlocal
