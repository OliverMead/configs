# [[ `date +%P` = "am" ]] && echo 'Good morning, Oliver' || echo 'Good afternoon, Oliver'

# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && \
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

setopt extended_glob
typeset -U fpath
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/home/olivermead/.config/oh-my-zsh
TPMUX=/home/olivermead/.tmux/plugins/tpm
[ -d "$ZSH" ] || git clone https://github.com/ohmyzsh/ohmyzsh "$ZSH"
[ -d "$TPMUX" ] || git clone https://github.com/tmux-plugins/tpm "$TPMUX"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="arrow"
ZSH_THEME="sunaku"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
[ -d "$ZSH/custom/plugins/zsh-syntax-highlighting/" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH/custom/plugins/zsh-syntax-highlighting"
[ -d "$ZSH/custom/plugins/zsh-completions" ] || git clone https://github.com/zsh-users/zsh-completions.git "$ZSH/custom/plugins/zsh-completions"
[ -d "$ZSH/custom/plugins/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH/custom/plugins/zsh-autosuggestions"
[ -d "$ZSH/custom/themes/powerlevel10k" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH/custom/themes/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-completions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export LESSHISTFILE=/dev/null

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# export LC_COLLATE="C"
export MANPATH=/opt/texlive/2020/texmf-dist/doc/man:$MANPATH
export INFOPATH=/opt/texlive/2020/texmf-dist/doc/info:$INFOPATH
export PATH=/home/olivermead/.cabal/bin:/home/olivermead/.local/bin:/opt/texlive/2020/bin/x86_64-linux:$PATH
# export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL="nvim"
export RUSTUP_HOME=".config/rustup"
alias ll="ls -lhv"
alias l="ls -alhv"
alias work="cd ~/Documents/uniCourseWork/"
alias w="work"
alias joycon="sudo ~/bin/jcdriver --invert LV --invert LH --invert RV --invert RH"
alias :q="exit"
alias :Q=":q"
alias q="exit"
alias n="nvim"
alias please="sudo"
# alias rotate="xrandr -o 3 && xinput map-to-output 12 LVDS1 && xinput map-to-output 13 LVDS1"
function rotate() {
  xrandr -o $1
  xinput map-to-output 12 LVDS1
  xinput map-to-output 13 LVDS1
  xinput map-to-output 14 LVDS1
}
alias unrotate="xrandr -o 0 && xinput map-to-output 12 LVDS1 && xinput map-to-output 13 LVDS1 && xinput map-to-output 14 LVDS1"
alias enhance='function ne() { docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`"; }; ne'
alias vnctunnel='ssh -i ~/.ssh/homekey homenet -L 9901:localhost:5901'
alias getip='curl icanhazip.com'
alias vpn="sudo sshuttle --dns -r olivermead@homenet:443 0/0 -x homenet -e 'ssh -i /home/olivermead/.ssh/homekey'"
alias rip="HandBrakeCLI -Z 'Very Fast 576p25' -i /dev/sr0 --all-subtitles --subtitle-burned='none' --main-feature -o"

bindkey -v
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }

# # # Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# # Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

# # # Updates editor information when the keymap changes.
# function zle-keymap-select() {
#   zle reset-prompt
#   zle -R
# }

# zle -N zle-keymap-select

# function vi_mode_prompt_info() {
#   echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
# }

# # define right prompt, regardless of whether the theme defined it
# RPS1=''
# RPS2=$RPS1

# zle -N zle-line-init
# zle -N zle-keymap-select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
