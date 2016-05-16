# sourcing ~/.bashrc
if [ -e ${HOME}/.bashrc ]; then
  export BASH_ENV=${HOME}/.bashrc
  . ${HOME}/.bashrc
fi

## PS1 is defined in the .bashrc file, as the global configuration files
## redefine it when a new shell is invoked

function proxyon(){
  export HTTP_PROXY="http://127.0.0.1:8998"
  export HTTPS_PROXY=${HTTP_PROXY} FTP_PROXY=${HTTP_PROXY}

  # optional for debugging
  #export GIT_CURL_VERBOSE=1

  echo -e "Proxy-related environment variables set:"
  env | grep -e _PROXY -e GIT_ | sort
}

function proxyoff(){
  variables=("HTTP_PROXY" "HTTPS_PROXY" "FTP_PROXY")

  for i in "${variables[@]}"; do unset $i; done

  echo -e "Proxy-related environment variables removed."
  env | grep -e _PROXY -e GIT_ | sort
}