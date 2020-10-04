# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/home/olivermead/.config/oh-my-zsh/
[ -d "$ZSH" ] || git clone git@github.com:ohmyzsh/ohmyzsh "$ZSH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sunaku"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
[ -d ~/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/ ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
plugins=(git zsh-syntax-highlighting)


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

export EDITOR='emacsclient -nc'
export GIT_EDITOR='emacsclient -nc'
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
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

#export LC_COLLATE="C"
export MANPATH=/usr/local/texlive/2019/index.html:$MANPATH
export INFOPATH=/usr/local/texlive/2019/texmf-dist/doc/info:$INFOPATH
export PATH=/home/olivermead/.cabal/bin:/home/olivermead/.local/bin:/usr/local/texlive/2019/bin/x86_64-linux:$PATH
# export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL="nvr -cc split --remote-wait"
export RUSTUP_HOME=".config/rustup"
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export GTK_THEME=oomox-xresources
# export GTK_RC_FILES=~/.gtkrc-2.0
#export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
alias ll="ls -lh --group-directories-first"
alias l="ls -alh --group-directories-first"
alias work="cd ~/Documents/uniCourseWork/"
alias w="work"
alias c="clear"
# alias unit=". unitnum"
# alias cl="c && l"
# alias g=". s g"
# alias workon=". workonfile"
alias joycon="sudo ~/bin/jcdriver --invert LV --invert LH --invert RV --invert RH"
alias :q="exit"
alias :Q=":q"
alias q="exit"
# alias onesync="onedrive --local-first --synchronize"
alias n="nvim"
alias please="sudo"
export NEXT_ROTATE=1
alias rotate="xrandr -o $NEXT_ROTATE && xsetwacom set stylus Rotate cw && export NEXT_ROTATE=$((($NEXT_ROTATE +1) % 4))"
#alias stack="cabal v1-exec stack"
alias enhance='function ne() { docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`"; }; ne'
# bindkey -v
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#     RPS2=$RPS1
#     zle reset-prompt
# }

# # Better searching in command mode
# bindkey -M vicmd '?' history-incremental-search-backward
# bindkey -M vicmd '/' history-incremental-search-forward

# # Beginning search with arrow keys
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
# bindkey -M vicmd "k" up-line-or-beginning-search
# bindkey -M vicmd "j" down-line-or-beginning-search

# # Updates editor information when the keymap changes.
# function zle-keymap-select() {
#   zle reset-prompt
#   zle -R
# }

# zle -N zle-keymap-select

# function vi_mode_prompt_info() {
#   echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
# }

# # define right prompt, regardless of whether the theme defined it
RPS1=''
RPS2=$RPS1

# zle -N zle-line-init
# zle -N zle-keymap-select

[ `date +%P` = "am" ] && echo 'Good morning, Oliver' || echo 'Good afternoon, Oliver'

