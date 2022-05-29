# Created by newuser for 5.9

# export ZDOTDIR=$HOME/.config/zsh
# source "$HOME/.config/zsh/.zshrc"
#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory


# Alias 
alias v='nvim'
alias ls='ls --color=auto'
alias e='exit'
alias cls='clear'
alias x='xmodmap ~/.Xmodmap'
alias web= 'cd documents/web'
alias g='git'

# Exec the script files

## autoload vcs and colors
# autoload -Uz vcs_info
autoload -U colors && colors

# github
autoload -Uz vcs_info
# precmd() { vcs_info }

# enable only git 
zstyle ':vcs_info:*' enable git

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"


# format our main prompt for hostname current folder, and permissions.
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "
# TODO look into this for more colors
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# also ascii escape codes



# PROMPT='%(?.%F{blue}√.%F{red}?%?)%f %B%F{240}%1~%f%b'
# format our main prompt for hostname current folder, and permissions.
# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%} "
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
# PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f %# '

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
# source "$ZDOTDIR/zsh-functions"

# # Normal files to source
# zsh_add_file "zsh-exports"
# zsh_add_file "zsh-vim-mode"
# zsh_add_file "zsh-aliases"
# zsh_add_file "zsh-prompt"

# # Plugins
# zsh_add_plugin "zsh-users/zsh-autosuggestions"
# zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
# zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_completion "esc/conda-zsh-completion" false
# # For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# # More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# TODO Remove these
setxkbmap -option caps:escape
xset r rate 210 40

# Speedy keys
xset r rate 210 40

# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# For QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct


# vim mode config
# ---------------

# Activate vim mode.
bindkey -v

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
 function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select

    # Use beam shape cursor on startup.
    echo -ne '\e[5 q'

    # Use beam shape cursor for each new prompt.
    preexec() {
       echo -ne '\e[5 q'
    }

# Use vim key in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable the zsh-syntax-highlighting
source /home/thangjenny/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/thangjenny/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# colors config
# ---------------

# Zsh to use the same colors as ls

LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Auto run the commanf for loading the xmodmap file
xmodmap ~/.Xmodmap
