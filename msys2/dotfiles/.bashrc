# Sourcing the system-wide bashrc file
test -e /etc/bashrc && . /etc/bashrc

# non-printable characters must be enclosed inside \[ and \]
if [ -n "${VCINSTALLDIR}" ] ; then
  PS1='\[\033]0;${PDG_COMPILER_VERSION}@${PDG_ADDRESS_MODEL} [${PDG_COMPILER_TYPE} ${PDG_TARGET_TYPE}]\007\]'  # Terminal title bar
  PS1="$PS1"'\[\033[0;33m\][${PDG_COMPILER_TYPE} ${PDG_TARGET_TYPE}]'  # Compiler & Target in Brown
else
  PS1='\[\033]0;PortableGit\007\]'      # Terminal title bar
fi
PS1="$PS1"'\[\033[1;34m\][${SHLVL}]'               # Shell level in Cyan
PS1="$PS1"'\[\033[0;33m\]`__git_ps1 | cut -c 2-`'  # Git Prompt in Brown
PS1="$PS1"'\[\033[1;32m\]:\w# '                    # current working directory and prompt (always #) in Light Green
export PS1                                         # Export prompt definition in sub-shells

#alias gitgui='/mingw64/libexec/git-core/git-gui'
alias gitui='gitk --date-order --all'

#alias cvsstat='cvs status 2> /dev/null | grep "File:" | grep -v "Up-to-date"'
#alias cvsq='cvs -n update -d -P 2> /dev/null'

alias dev='cd /c/Development'
alias cpp='dev && cd CPP_Projects'
alias net='dev && cd NET_Projects'
if [ ${COMPUTERNAME} = B10FINW043E ] || [ ${COMPUTERNAME} = B10FINW0982 ]; then
  alias pdg='dev && cd PDG_Projects'
  alias ql='dev && cd QL_Projects'
  alias pl='pdg && cd pdglib_devel/pdglib'
  alias xl='pl && cd interfaces/library/pdg/excel'
fi

if [ -n "${VCINSTALLDIR}" ] ; then
  alias dbg='PDG_TARGET_TYPE=debug'
  alias rel='PDG_TARGET_TYPE=release'
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
