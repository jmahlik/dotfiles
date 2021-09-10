REPO=https://
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       "${REPO}"raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
