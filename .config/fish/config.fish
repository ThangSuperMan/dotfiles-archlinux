# Basic config
set fish_greeting""

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# fish_add_path /opt/homebrew/bin/

# Setting the color for EXA 
export EXA_COLORS="sn=37"
export LS_COLORS=".js=36"

alias gr='go run'
alias g='go'
alias g="git"
alias tks='tmux kill-server'
alias e='exit'
alias cls='clear'
alias v='nvim'

# ide
alias ide "tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50"
alias ide-h "tmux split-window -h -p 30 && tmux split-window -v -p 30"

# alias neofetch='neofetch --ascii_distro arch'

# alacritty terminal create new instance in the current acitve directory
# ctrl + cmd - n : alacritty --working-directory (pwd)
alias n 'alacritty --working-directory (pwd)'


# alias ide "tmux split-window -h -p 30 {pane_current_path}"

# bind-key \\ split-window -h -c "#{pane_current_path}"
# bind-key - split-window -v -c "#{pane_current_path}"

# React native fix erroe router
alias config='export NODE_OPTIONS=--openssl-legacy-provider' 
