# alias python="python3"

alias ls='ls -l'
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/go/bin:$PATH:$HOME/.poetry/bin:"

set -o vi

export WINHOME="/mnt/c/Users/Thrustin"
export SYSTEMD_EDITOR=nvim
export VISUAL=nvim
export EDITOR="$VISUAL"
alias vim=$VISUAL

function cd() {
  builtin cd $1

  if [[ -n "$VIRTUAL_ENV" ]] ; then
    echo "deactivate $VIRTUAL_ENV"
    deactivate
  fi

  if [[ -d ./.venv ]] ; then
    . ./.venv/bin/activate
    echo "activate $VIRTUAL_ENV"
  elif [[ -d ./venv ]] ; then
    . ./venv/bin/activate
  fi
}

export GPG_TTY=$(tty)

export GOPATH="$HOME/golib"

export PATH=$PATH:$GOPATH/bin
