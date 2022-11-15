# sourcing ~/.bashrc
if [ -e ${HOME}/.bashrc ] ; then
  export BASH_ENV=${HOME}/.bashrc
  . ${HOME}/.bashrc
fi

## *NB* PS1 is defined in the .bashrc file, as the global
## configuration files redefine it when a new shell is invoked

# VCINSTALLDIR is set by vcvarsall.bat
if [ -n "${VCINSTALLDIR}" ] ; then
  export PDG_COMPILER_TYPE=msvc
  export PDG_TARGET_TYPE=debug
fi
