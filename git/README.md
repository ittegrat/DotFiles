# Setup
## Upgrade
  1. Rename old installl folder
  2. disable doskey before install (place `goto :eof` at beginning of autorun)
  3. exec PortableGit-x.xx.xx-64-bit.7z.exe
  4. extract make to /usr/bin
  5. install filedep

## First time install
  1. mkdir *home* under %USERPROFILE%
  2. if *home* is created elsewhere, adjust `msys-git.cmd`
  3. copy dotfiles to home
  4. exec git config (~/bin/git-post-install.sh):
    + `git config --global core.autocrlf false`
    + `git config --global user.name ...`
    + `git config --global user.email ...`
  5. possibly add:
    + windows links (symbolic or junction ??)
    + lines to /etc/fstab `C:/path/to/... /... ntfs binary,posix=0,noacl,user 0 0`

## MSYS Notes
MSYS2_ARG_CONV_EXCL to preserve paths in make (cfr. [http://sourceforge.net/p/msys2/wiki/Porting/])
