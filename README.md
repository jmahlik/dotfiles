# vimrc

Dotfiles for [neovim](https://neovim.io/) primarily for python development. 

## Setup
Requires neovim >0.6.1

Copy the entire nvim directory to the appropriate place for your os.

Config is still a mix of lua and vimscript. Hoping to eliminate the vimscript
when I get around to it.

## Layout

Plugins `lua/plugins.lua`
Configs for various plugins `lua/configs.lua`

## Main Features

* Uses coc for code completion 
  - Mapped flake8, mypy etc. 
  - This is configurable.
  - Many languages configured via coc-setting.json and `lua/configs/coc.vim`
  - Works best when launched out of the project working directory with an active venv 
* Terminal just like an IDE via [neoterm](https://github.com/kassio/neoterm)
  - Termnail shell is set to bash, but this is configurable in the `neovim/lua/configs/neoterm.lua`.
  - Pycharm/vscode like behavior
  - Press ctrl+l to send highlighted lines in normal or visual mode
  - Make sure the git bash executable is ahead of the bash.exe in C:\\windows\

## Not for windows users

Setting this up was beyond painful on Windows. 

Mainly getting the terminal to send correct lines and start the correct shell. 

The terminal is meant to be used from windows terminal with git bash as the shell, 
not cmd or powershell.

Using nvim from inside the built in git bash terminal doesn't play well with the terminal. 
So you will need to set up a windows terminal profile pointing to the git bash
executable.

You will need a c compiler for some of the extensions like treesitter to work.
Feel free to comment these out in `nvim/lua/plugins.lua`.

Feel free to open an issue if you have questions. 

