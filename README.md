# vimrc

Dotfiles for using [neovim](https://neovim.io/) for data science, data engineering, python development on Windows. The terminal is meant to be used from nvim-qt.exe. Using nvim from inside git bash doesn't play well with the terminal. Everything else works though. 

Setting this up was beyond painful on Windows. Mainly getting the terminal to send correct lines and start the correct shell. Feel free to open an issue if you have questions. 

## Main Features

* Terminal just like an IDE via [neoterm](https://github.com/kassio/neoterm)
  - Termnail shell is set to git bash, but this is configurable in the `init.vim`
  - Pycharm/vscode like behavior
  - Sources the .venv in the project directory before startup (this is also configurable)
  - Press ctrl+enter to send highlighted lines in normal or visual mode
  - Make sure the git bash executable is ahead of the bash.exe in C:\\windows\
* Uses coc for code completion 
  - Mapped to the .venv for flake8, mypy etc. This is configurable.
