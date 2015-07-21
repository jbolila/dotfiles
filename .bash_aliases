#!sh

alias ls='ls --color=auto'

export PAGER=/usr/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

alias vi="vim"
alias v="vim"
alias vs="vim-scp"
# rsync -e ssh -van --delete . remote@host:remotedir
alias vim-raw="vim -u NORC"
alias ack="ag"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lsd="ls -la --color | grep '^d'"

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias listen="lsof -Pan -i tcp -i udp"
alias wp="perlbrew list | grep \@"
alias perlcritic11='perlcritic -verbose 11'
alias perlcritic5='perlcritic -verbose 5'
alias perlcritic8='perlcritic -verbose 8'

alias c='pygmentize -O style=solarizeddark -f console256 -g'

alias now='perl -M5.010 -e "say time"'

alias tmux="tmux -2"
alias mkpass="openssl rand -base64 32"

alias npm-outdated="npm outdated --json --depth=0 | jq --ascii-output --monochrome-output '. | keys | .[]'"
alias npm-outdated-update="npm outdated --json --depth=0 | jq --ascii-output --monochrome-output '. | keys | .[]' | xargs npm install $1 --save-dev"

ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

alias update='sudo pacman -Syu; sudo npm update npm@latest -g; sudo npm update -g; gem list `gem list | cut -d " " -f 1`'

function d {
  if [[ $# > 0 ]]; then
    dict -d gcide $@ | colorit
  else
    dict -I | colorit
  fi
}
function di {
  if [[ $# > 0 ]]; then
    dict -d foldoc $@ | colorit
  else
    dict -I | colorit
  fi
}
function dp {
  if [[ $# > 0 ]]; then
    dict -d freedict-por-eng $@ | colorit
  else
    dict -I | colorit
  fi
}
function t {
  if [[ $# > 0 ]]; then
    dict -d moby-thesaurus $@ | colorit
  else
    dict -I | colorit
  fi
}
