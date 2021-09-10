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
