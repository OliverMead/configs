#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s extglob globstar 

PS1='\[\e[1;32m\]»\h(\j) \s \D{%F}|\t [\#]\n\W/ \$\[\e[m\] '

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="ls -lhv"
alias l="ls -alhv"
alias getip='curl icanhazip.com'
alias rip="HandBrakeCLI -Z 'Fast 576p25' --no-comb-detect --no-deinterlace -i /dev/sr0 --all-subtitles --subtitle-burned='none' --main-feature -o"

if [[ -z "${PREFIX}" ]]; then
	export PREFIX=/usr
fi

export LANG=en_GB.UTF-8

export EDITOR='emacsclient -a vim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export LESSHISTFILE=/dev/null
export WM='dwm'

export MANPATH=$PREFIX/local/texlive/2025/texmf-dist/doc/man:$MANPATH
export INFOPATH=$PREFIX/local/texlive/2025/texmf-dist/doc/info:$INFOPATH
export PATH=$HOME/.cargo/bin:$HOME/node_modules/.bin:$HOME/.ghcup/bin:$HOME/.cabal/bin:$HOME/.local/bin:$PREFIX/local/texlive/2025/bin/x86_64-linux:$PATH
