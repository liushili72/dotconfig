source $HOME/.dotconfig/dotzsh/antigen.zsh
export ADOTDIR="$HOME/.dotconfig/dotzsh/.antigen"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  git
  sudo
  zsh-users/zsh-completions src
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

## bundles for OS X
if [[ "$OSTYPE" == "darwin"* ]]; then
  antigen bundle osx
  antigen bundle sublime
  antigen bundle $ADOTDIR/vagrant
fi

## themes
antigen theme candy

antigen apply
