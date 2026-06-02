# The NERDTerm

The NERDTerm is a terminal toggle plugin for the Vim editor.

<div align="center">
  <img src="https://raw.githubusercontent.com/Heptite/nerdterm/main/assets/nerdterm.png">
</div>

## Installation

Install via your preferred package manager. Example using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'wuelnerdotexe/nerdterm'
```

## Usage

NERDTerm provides only and exclusively one command:

```vim
:NERDTermToggle
```

Which you can map to your favorite map, for example:

```vim
map <c-`> <Plug>(NERDTermToggle)
imap <c-`> <C-O><Plug>(NERDTermToggle)
tmap <c-`> <Plug>(NERDTermToggle)
```

## License

[GPL3 &copy; Christian J. Robinson](https://github.com/Heptite/nerdterm/blob/main/LICENSE)
