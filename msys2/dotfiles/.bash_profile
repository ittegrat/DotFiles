# sourcing ~/.bashrc
if [ -f ${HOME}/.bashrc ] ; then
  export BASH_ENV=${HOME}/.bashrc
  . ${HOME}/.bashrc
fi

## *NB* PS1 is defined in the .bashrc file, as the global
## configuration files redefine it when a new shell is invoked

# AddPath 'path' ['back']
function AddPath() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    if [ -n "$2" ]; then
      export PATH="${PATH:+"$PATH:"}$1"
    else
      export PATH="$1${PATH:+":$PATH"}"
    fi
  fi
}

# VCINSTALLDIR is set by vcvarsall.bat
if [ -n "${VCINSTALLDIR}" ] ; then
  export PDG_COMPILER_TYPE=msvc
  export PDG_TARGET_TYPE=debug
fi

AddPath /c/Programs/PortableApps/SciTE back
#AddPath /c/Programs/PortableApps/Bin back
