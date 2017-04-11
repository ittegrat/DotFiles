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

alias gitgui=/mingw64/libexec/git-core/git-gui

alias cvsstat='cvs status 2> /dev/null | grep "File:" | grep -v "Up-to-date"'
alias cvsq='cvs -n update -d -P 2> /dev/null'

alias dev='cd /c/Development'
alias pdg='cd /c/Development/PDG_Projects/pdglib_devel/pdglib'
alias xll='cd /c/Development/PDG_Projects/pdglib_devel/Win32Interfaces/PDGLib'

if [ -n "${VCINSTALLDIR}" ] ; then
  alias dbg='PDG_TARGET_TYPE=debug'
  alias rel='PDG_TARGET_TYPE=release'
fi
