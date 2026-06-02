# The NERDTerm

The NERDTerm is a terminal toggle plugin for the Vim editor.

<div align="center">
  <img src="https://raw.githubusercontent.com/Heptite/nerdterm/main/assets/nerdterm.png">
</div>

## Installation

Install via your preferred package manager. Example using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'Heptite/nerdterm'
```

Or use Vim's built-in package support:

### Unix/MacOS

In a terminal type these commands:

```sh
mkdir -p ~/.vim/pack/cjr/start
cd ~/.vim/pack/cjr/start
git clone https://github.com/Heptite/nerdterm.git
```

### Windows

Press `Windows+R`, type in "`cmd`" and press `Enter`.  In that window run these
commands:

```batch
mkdir %USERPROFILE%\vimfiles\pack\cjr\start
cd %USERPROFILE%\vimfiles\pack\cjr\start
git clone https://github.com/Heptite/nerdterm.git
```

After installing using git you can always update by going into the
`pack/cjr/start/nerdterm` directory and typing: `git pull`


## Usage

NERDTerm provides one command:

```vim
:NERDTermToggle
```

Which you can map to your favorite map, for example the default is:

```vim
map <c-`> <Plug>(NERDTermToggle)
imap <c-`> <C-O><Plug>(NERDTermToggle)
tmap <c-`> <Plug>(NERDTermToggle)
```

See `:help NERDTerm` for details on how to configure the plugin.

## License

[GPL3 &copy; Christian J. Robinson](https://github.com/Heptite/nerdterm/blob/main/LICENSE)
