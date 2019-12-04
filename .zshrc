export ZSH="/Users/mikekelly/.oh-my-zsh"

DEFAULT_USER=$USER
ZSH_THEME="agnoster"

plugins=(
  git
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh
[ -f .local_zshrc ] && source .local_zshrc

export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag -g ""'

source ~/.aliases
[ -f .local_aliases ] && source .local_aliases

# edit commands in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# asdf vm
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
