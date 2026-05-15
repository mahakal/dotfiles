#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000
HISTFILESIZE=20000

# %F Full date (YYYY-MM-DD)2026-03-26
# %T Time (HH:MM:SS)14:35:22
# $$ is a special bash variable that holds the current shell's Process ID (PID).
SESSION_ID="$$"
HISTTIMEFORMAT="%F %T [${SESSION_ID}] "            # Add timestamps
# Controls what happens to ~/.bash_history when a shell session exits.
# Behavior        What happens 
# Default (off)   Current session overwrites ~/.bash_history — you lose history from other sessions
# histappend on   Current session appends to ~/.bash_history — all sessions are preserved
shopt -s histappend                # Append instead of overwrite


alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


source /usr/share/nvm/init-nvm.sh

# uv
export PATH="~/.local/bin:$PATH"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

if grep -qv 'fish' /proc/$PPID/comm && [[ ${SHLVL} -le 2 ]]
then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	exec fish $LOGIN_OPTION
fi

