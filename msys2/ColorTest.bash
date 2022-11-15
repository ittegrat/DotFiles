#!/bin/bash

PrevPS=${PS1}

PS1='Prompt Color Test\n'               #
PS1="$PS1"'\[\e[1;37m\]White        \n' # White
PS1="$PS1"'\[\e[0;30m\]Black        \n' # Black
PS1="$PS1"'\[\e[1;30m\]Dark Gray    \n' # Dark Gray
PS1="$PS1"'\[\e[0;31m\]Red          \n' # Red
PS1="$PS1"'\[\e[1;31m\]Light Red    \n' # Light Red
PS1="$PS1"'\[\e[0;32m\]Green        \n' # Green
PS1="$PS1"'\[\e[1;32m\]Light Green  \n' # Light Green
PS1="$PS1"'\[\e[0;33m\]Brown        \n' # Brown
PS1="$PS1"'\[\e[1;33m\]Yellow       \n' # Yellow
PS1="$PS1"'\[\e[0;34m\]Blue         \n' # Blue
PS1="$PS1"'\[\e[1;34m\]Light Blue   \n' # Light Blue
PS1="$PS1"'\[\e[0;35m\]Purple       \n' # Purple
PS1="$PS1"'\[\e[1;35m\]Light Purple \n' # Light Purple
PS1="$PS1"'\[\e[0;36m\]Cyan         \n' # Cyan
PS1="$PS1"'\[\e[1;36m\]Light Cyan   \n' # Light Cyan
PS1="$PS1"'\[\e[0;37m\]Light Gray   \n' # Light Gray
