# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if its's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --quiet "https://github.com/zdharma-continuum/zinit.git" "$ZINIT_HOME"
fi

#source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

#add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode

#load completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# Enable colors
autoload -U colors && colors

#unset bell
unsetopt BEEP

#disable ls highlighting directory
LS_COLORS=$LS_COLORS:'ow=1;34:'; export LS_COLORS

#set up beutiful prompts
newline=$'\n'
#PS1="%B%F{blue}┌─────%f%F{black}%K{blue}%n%k%f%F{blue}─────%f%F{black}%K{blue}%~%k%f%F{blue}${newline}└>%f%F{cyan}\$%f%b "
PS1="%F{blue}┌─────%f%F{cyan}%n%f%F{blue}─────%f%F{cyan}%~%f%F{blue}${newline}└>%f%F{cyan}\$%f "

# history 
export HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
export SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

