# Setup
## Upgrade
  1. Download PortableGit from [github/git-for-windows](https://github.com/git-for-windows/git/releases)
  2. Rename old installl folder
  3. disable doskey before install (place `goto :eof` at beginning of autorun)
  4. exec PortableGit-x.xx.xx-64-bit.7z.exe
  5. if the SFX installer fails (i.e. the PortableGit folder still contains `post-install.bat`)
     open a cmd and exec `git-bash.exe --no-needs-console --hide --no-cd --command=post-install.bat`
     (cfr. `post-install.bat` for details)
  6. extract [make](http://repo.msys2.org/msys/x86_64/) to /usr/bin
  7. install filedep

## First time install
  1. mkdir *home* under %USERPROFILE%
  2. if *home* is created elsewhere, adjust `msys-git.cmd`
  3. copy dotfiles to home
  4. set git globals (~/bin/git-post-install.sh):  
     `git config --global core.safecrlf true`  
     `git config --global user.name ...`  
     `git config --global user.email ...`  
  5. possibly add:  
     windows links (symbolic or junction ??)  
     lines to /etc/fstab `C:/... /... ntfs binary,posix=0,noacl,user 0 0`

## MSYS Notes
MSYS2_ARG_CONV_EXCL (a `;` separated list of prefixes for which the translation is inhibited) to preserve paths in make (cfr. [Filesystem namespaces](https://github.com/msys2/msys2/wiki/Porting))
