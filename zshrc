# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# mrtheduts' zshrc

# Path to your oh-my-zsh installation.
export ZSH="/home/mrtheduts/.oh-my-zsh"

# Load icons from nerdfont
POWERLEVEL9K_MODE='nerdfont-complete'

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history sudo zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
autoload -U compinit && compinit

# Loading oh-my-zsh file
source $ZSH/oh-my-zsh.sh

# Aliases
alias ls='ls --color -h --group-directories-first'
alias please='sudo $(fc -ln -1)'

# Custom Environment Variables
export EDITOR="/usr/bin/nvim"
export LS_COLORS="$(vivid generate molokai)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
