vim9script

# -----------------------------------------------------------------------------
# Name:     plugin/nerdterm.vim
# Author:   Christian J. Robinson <heptite@gmail.com>
# URL:      https://github.com/Heptite/nerdterm
# License:  GPL3 (C) 2026 Christian J. Robinson
# About:    A term toggle plugin for vim.
# -----------------------------------------------------------------------------

command NERDTermToggle call nerdterm#Toggle()

map <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>
imap <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>
tmap <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>

if hasmapto('<Plug>(NERDTermToggle)') == 0
	map <c-`> <Plug>(NERDTermToggle)
	imap <c-`> <Plug>(NERDTermToggle)
	tmap <c-`> <Plug>(NERDTermToggle)
endif
