# Enable Tmux autostart with Zsh
# ZSH_TMUX_AUTOSTART=true

# Set the path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set the Zsh theme to "spaceship"
ZSH_THEME="spaceship"

# Load the required plugins for Zsh
plugins=(git tmux zsh-autosuggestions)

# Source the Oh My Zsh script
source $ZSH/oh-my-zsh.sh

# Set the Docker host
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Set the NVM directory and load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source the Rust Cargo environment
. "$HOME/.cargo/env"

# Initialize rbenv for Zsh
eval "$(~/.rbenv/bin/rbenv init - zsh)"

# Add local binaries to the PATH
export PATH="$HOME/.local/bin:$PATH"

# Set the default editor to LunarVim
export EDITOR="lvim"

# Aliases for easy access to Zsh and Oh My Zsh configurations
alias lvimconfig="lvim ~/.config/lvim/config.lua"
alias tmuxconfig="lvim ~/.tmux.conf"
alias kittyconfig="lvim ~/.config/kitty/kitty.conf"
alias zshconfig="lvim ~/.zshrc"
alias ohmyzsh="lvim ~/.oh-my-zsh"
alias polybarconfig="lvim ~/.config/polybar/config.ini"
alias sxhkdconfig="lvim ~/.config/sxhkd/sxhkdrc"
alias alacrittyconfig="lvim ~/.config/alacritty/alacritty.yml"
alias bspwmconfig="lvim ~/.config/bspwm/bspwmrc"
alias picomconfig="lvim ~/.config/picom/picom.conf"
