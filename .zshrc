# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zshconfig/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zshconfig/.zsh-custom

# ZSH Theme
ZSH_THEME="candy"

# ZSH Plugins
plugins=(
  bower
  common-aliases
  git
  sublime
  sudo
  vagrant
)

# User configuration
DISABLE_AUTO_UPDATE=true

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/vagrant.sh
