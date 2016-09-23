## Setup
  1. disable doskey befor install (place `goto :eof` at beginning of autorun)
  2. exec PortableGit-x.xx.xx-64-bit.7z.exe
  3. extract make to /usr/bin
  4. mkdir /docs
  5. add to /etc/fstab `%USERPROFILE%/Documents /docs ntfs binary,posix=0,noacl,user 0 0`
  6. mkdir /home
  7. copy content to /home
  8. exec git-post-install.sh
  9. install filedep

## MSYS Notes
MSYS2_ARG_CONV_EXCL to preserve paths in make
