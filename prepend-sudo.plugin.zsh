#!/usr/bin/env zsh

# add sudo before command with ctrl+s, esc+esc
function prepend-sudo() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}

zle -N prepend-sudo
# defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" prepend-sudo
# defined shortcut keys: [Ctrl-s]
bindkey "^[s" prepend-sudo
