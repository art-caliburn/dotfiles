#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

alias la='eza -la'
alias ls='eza --icons=auto'
alias grep='grep --color=auto'
alias dota='steam steam://rungameid/570/'
alias please='sudo'
alias cat='bat '
alias update='sudo pacman -Syu'
alias upgrade='sudo pacman -Syu'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

if !  systemctl is-active --quiet bootmsg; then
  fastfetch
  echo
  echo "Welcome to caliburn! Running daemon diagnostics:"
  systemctl --failed
  echo
  sudo systemctl start bootmsg.service
  echo "Todays quote is:"
  fortune
  echo
  echo "happy autisming"
  echo " "
fi
eval "$(fzf --bash)"
eval "$(starship init bash)"
