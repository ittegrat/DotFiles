# Sourcing the system-wide bashrc file
test -f /etc/bashrc && . /etc/bashrc

# non-printable characters must be enclosed inside \[ and \]
if [ -n "${VCINSTALLDIR}" ] ; then
  PS1='\[\033]0;$(__tbar_ps1 ${PDG_COMPILER_VERSION}@${PDG_ADDRESS_MODEL})\007\]'  # Terminal title bar
  PS1="$PS1"'\[\033[0;33m\][${PDG_COMPILER_TYPE} ${PDG_TARGET_TYPE}]'  # Compiler & Target in Brown
else
  PS1='\[\033]0;$(__tbar_ps1 PortableGit)\007\]'      # Terminal title bar
fi
PS1="$PS1"'\[\033[1;34m\][${SHLVL}]'               # Shell level in Cyan
PS1="$PS1"'\[\033[0;33m\]$(__git_ps1 "(%s)")'       # Git Prompt in Brown
PS1="$PS1"'\[\033[1;32m\]:\w# '                    # current working directory and prompt (always #) in Light Green
export PS1                                         # Export prompt definition in sub-shells

#alias gitgui='/mingw64/libexec/git-core/git-gui'
alias gitui='gitk --date-order --all'

#alias cvsstat='cvs status 2> /dev/null | grep "File:" | grep -v "Up-to-date"'
#alias cvsq='cvs -n update -d -P 2> /dev/null'

alias dev='cd /c/Development'
alias cpp='dev && cd CPP_Projects'
alias net='dev && cd NET_Projects'
if [ ${COMPUTERNAME} = B11FINW0A82 ]; then
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
  proxy_host=${1:-localhost}
  proxy_port=${2:-8998}
  export HTTP_PROXY="http://${proxy_host}:${proxy_port}"
  export HTTPS_PROXY=${HTTP_PROXY} FTP_PROXY=${HTTP_PROXY}
  # optional for debugging
  #export GIT_CURL_VERBOSE=1
  echo -e "Proxy-related environment variables set:"
  env | grep -e proxy -e PROXY -e GIT_ | sort
}
function proxyoff() {
  local vars=(http_proxy https_proxy ftp_proxy)
  for v in ${vars[@]}; do unset $v; unset ${v^^}; done
  echo -e "Proxy-related environment variables removed."
  env | grep -e proxy -e PROXY -e GIT_ | sort
}

function __tbar_ps1() {
  local gitstr=$(__git_ps1 "%s")
  if [ -n "${gitstr}" ]; then
    printf "%s (%s)" $(basename "$(git rev-parse --show-toplevel)") ${gitstr}
  else
    printf "%s" "$1"
  fi
}
