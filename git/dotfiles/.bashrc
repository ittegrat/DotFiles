# Sourcing the system-wide bashrc file
test -e /etc/bashrc && . /etc/bashrc

# non-printable characters must be enclosed inside \[ and \]
PS1='\[\033]0;PortableGit ($MSYSTEM)\007\]'        # Terminal title bar
PS1="$PS1"'\[\033[1;34m\][${SHLVL}]'               # Shell level in Cyan
PS1="$PS1"'\[\033[0;33m\]`__git_ps1 | cut -c 2-`'  # Git Prompt in Brown
PS1="$PS1"'\[\033[1;32m\]:\w# '                    # current working directory and prompt (always #) in Light Green
export PS1                                         # Export prompt definition in sub-shells

alias gitgui=/mingw64/libexec/git-core/git-gui
alias gitmerge='git merge --no-commit --no-ff'
alias reps='cd /c/Development'
