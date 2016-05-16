@echo off

set GitRoot=%~dp0PortableGit

::set http_proxy=http://localhost:8998
::set https_proxy=http://localhost:8998
::set ftp_proxy=http://localhost:8998

set HOME=%GitRoot%\home
start /b %GitRoot%\git-bash.exe --cd-to-home
