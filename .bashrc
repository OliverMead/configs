#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s extglob globstar 

PS1='\[\e[1;32m\]»\h(\j) \s \D{%F}|\t [\#]\n\W/ \$\[\e[m\] '

# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ll="ls -lhv"
alias l="ls -alhv"
alias d="du -hs ./* ./.*"
alias getip='curl icanhazip.com'
alias shrinkz="tar -I 'zstdmt -10' -cf"
alias shrinkx="tar -I 'xz -T 0' -cf"
alias fsttar="tar --zstd"
alias dlsite='wget -mpEk'
alias rip="HandBrakeCLI -Z 'Fast 576p25' --no-comb-detect --no-deinterlace -i /dev/sr0 --all-subtitles --subtitle-burned='none' --main-feature -o"

if [[ -z "${PREFIX}" ]]; then
	export PREFIX=/usr
fi

export LANG=en_GB.UTF-8

export EDITOR='emacsclient -r -a emacs'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export LESSHISTFILE=/dev/null
export WM='dwm'

if [ -d $PREFIX/local/texlive/2026/ ]; then
    PATH=$PREFIX/local/texlive/2026/bin/x86_64-linux:$PATH
    MANPATH=$PREFIX/local/texlive/2026/texmf-dist/doc/man:$MANPATH
    INFOPATH=$PREFIX/local/texlive/2026/texmf-dist/doc/info:$INFOPATH
fi

if [ -d $HOME/.local/bin/ ]; then
    PATH=$HOME/.local/bin:$PATH
fi

if [ -d $HOME/.cargo/bin ]; then
    PATH=$HOME/.cargo/bin:$PATH
fi

export PATH
export MANPATH
export INFOPATH
