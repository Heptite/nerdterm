vim9script

# -----------------------------------------------------------------------------
# Name:     autoload/nerdterm.vim
# Author:   Christian J. Robinson <heptite@gmail.com>
# URL:      https://github.com/Heptite/nerdterm
# License:  GPL3 (C) Christian J. Robinson
# About:    A term toggle plugin for vim.
# -----------------------------------------------------------------------------

var terminfo: dict<any> = { buffer_id: -1, state: 'closed' }

def GetSize(): number
	var size: number
	var tmp: any = get(g:, 'NERDTermSize', '25%')

	if tmp =~ '^[0-9]\+%$'
		size = float2nr(&lines * str2float('0.' .. tmp[0 : -1]))
	else
		size = str2nr(tmp)
	endif

	if size == 0
		echohl Error
		echomsg 'g:NERDTermSize is set to an invalid value. Defaulting to 25%'
		echohl NONE
		size = float2nr(&lines * 0.25)
	endif

	return size
enddef

def WindowOpenCommand(): string
	var size: number = GetSize()
	var where: string = get(g:, 'NERDTermLocation', 'bottom') == 'bottom' ? 'botright' : 'topleft'
	return $'{where} :{size}new'
enddef

def CreateTerm(): number
	execute WindowOpenCommand()
	var tmp_bufnr = bufnr()

	var buffer_id: number =
		term_start(&shell, {
			term_name: 'NERDTerm',
			term_rows: GetSize(),
			term_finish: 'close'
		})

	silent execute $':{tmp_bufnr}bwipeout'

	if buffer_id > 0
		setbufvar(buffer_id, '&filetype', 'nerdterm')
		setbufvar(buffer_id, '&buflisted', false)
	endif

	return buffer_id
enddef

export def Toggle()
	if !bufexists(terminfo.buffer_id)
		terminfo = { buffer_id: -1, state: 'closed' }
	endif

  if terminfo.state == 'opened'
		hide
		terminfo.state = 'closed'
  elseif terminfo.buffer_id > 0 && bufexists(terminfo.buffer_id)
		execute WindowOpenCommand()
		var tmp_bufnr = bufnr()
		execute $'buffer {terminfo.buffer_id}'
		silent execute $':{tmp_bufnr}bwipeout'
		terminfo.state = 'opened'
	else
		terminfo.buffer_id = CreateTerm()
		terminfo.state = 'opened'
  endif
enddef
