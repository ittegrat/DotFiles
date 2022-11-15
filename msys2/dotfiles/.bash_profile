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

function proxyon() {

  if [ -z "$1" ] ; then
    proxy_host=localhost
  else
    proxy_host=$1
  fi
  if [ -z "$2" ] ; then
    proxy_port=8998
  else
    proxy_port=$2
  fi

  export HTTP_PROXY="http://${proxy_host}:${proxy_port}"
  export HTTPS_PROXY=${HTTP_PROXY} FTP_PROXY=${HTTP_PROXY}

  # optional for debugging
  #export GIT_CURL_VERBOSE=1

  echo -e "Proxy-related environment variables set:"
  env | grep -e _PROXY -e GIT_ | sort
}

function proxyoff() {
  variables=("HTTP_PROXY" "HTTPS_PROXY" "FTP_PROXY")

  for i in "${variables[@]}"; do unset $i; done

  echo -e "Proxy-related environment variables removed."
  env | grep -e _PROXY -e GIT_ | sort
}
