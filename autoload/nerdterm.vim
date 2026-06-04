vim9script

# -----------------------------------------------------------------------------
# Name:     autoload/nerdterm.vim
# Author:   Christian J. Robinson <heptite@gmail.com>
# URL:      https://github.com/Heptite/nerdterm
# License:  GPL3 (C) 2026 Christian J. Robinson
# About:    A term toggle plugin for vim.
# -----------------------------------------------------------------------------

var terminal_info: dict<any> = { buffer_id: -1, opened: false }

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

def GetWindowOpenCommand(bufnr: number = -1): string
	var size: number = GetSize()
	var where: string = get(g:, 'NERDTermLocation', 'bottom') == 'bottom' ? 'botright' : 'topleft'
	if bufnr > 0
		return $'{where} :{bufnr}sbuf|resize {size}'
	else
		return $'{where} :{size}new'
	endif
enddef

def CreateTerm(): number
	execute GetWindowOpenCommand()

	var buffer_id: number =
		term_start(&shell, {
			term_name: 'NERDTerm',
			term_rows: GetSize(),
			term_finish: 'close',
			curwin: true
		})

	if buffer_id > 0
		setbufvar(buffer_id, '&filetype', 'nerdterm')
		setbufvar(buffer_id, '&buflisted', false)
	endif

	return buffer_id
enddef

export def Toggle()
	if !bufexists(terminal_info.buffer_id)
		terminal_info = { buffer_id: -1, opened: false }
	endif

	if terminal_info.opened
		hide
		terminal_info.opened = false
	elseif terminal_info.buffer_id > 0 && bufexists(terminal_info.buffer_id)
		execute GetWindowOpenCommand(terminal_info.buffer_id)
		terminal_info.opened = true
	else
		terminal_info.buffer_id = CreateTerm()
		terminal_info.opened = true
	endif
enddef
