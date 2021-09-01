function cd() {
  builtin cd $1

  if [[ -n "$VIRTUAL_ENV" ]] ; then
    echo "deactivate $VIRTUAL_ENV"
    deactivate
  fi

  if [[ -d ./.venv ]] ; then
    . ./.venv/Scripts/activate
    echo "activate $VIRTUAL_ENV"
  fi
}
