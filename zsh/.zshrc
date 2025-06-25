# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_AUTO_TITLE="true"

HIST_STAMPS="dd/mm/yyyy"

PROMPT='%n$ '

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# %%%%% Alias %%%%%
alias back='function _back() { for ((i=0; i<$1; i++)); do ..; done; }; _back'
alias py='python3'
alias run="clear && python3"
alias vi="nvim"
alias cls="clean && ls"
alias mat="cd /mnt/Malamute\ do\ Alaska/Estudos/Materias/"
alias grv="/usr/local/bin/grv"
alias c="clear"
alias lib="cd /mnt/Malamute\ do\ Alaska/Estudos/Livros"
alias tw="taskwarrior-tui"
alias provas="open '/mnt/Malamute do Alaska/Estudos/Materias/5ºPeriodo/CALENDARIO DE PROVAS ALUNOS.pdf'"
alias init="vi ~/.config/nvim/init.lua"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh
