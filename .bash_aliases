#!sh

alias ls='ls --color=auto'

alias vi="gvim"
alias ack="ag"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lsd="ls -la --color | grep '^d'"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias wp="perlbrew list | grep \@"
alias perlcritic11='perlcritic -verbose 11'
alias perlcritic5='perlcritic -verbose 5'
alias perlcritic8='perlcritic -verbose 8'

alias c='pygmentize -O style=monokai -f console256 -g'

alias now='perl -M5.010 -e "say time"'
# alias uri='perl -MURI::Escape -M5.010 -e \'my $nm = uri_escape("SpaceCo Network Network Domain"); say $nm\''

alias tmux="tmux -2"
alias mkpass="openssl rand -base64 32"

alias update='sudo pacman -Syu; sudo npm update npm -gf; sudo npm update -gf ; gem list `gem list | cut -d " " -f 1`'
