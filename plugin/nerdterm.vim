vim9script

# -----------------------------------------------------------------------------
# Name:     plugin/nerdterm.vim
# Author:   Christian J. Robinson <heptite@gmail.com>
# URL:      https://github.com/Heptite/nerdterm
# License:  GPL3 (C) Christian J. Robinson
# About:    A term toggle plugin for vim.
# -----------------------------------------------------------------------------

command NERDTermToggle call nerdterm#Toggle()

map <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>
tmap <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>

