augroup termdebug/autogdbinit
	au!
	au User TermdebugStartPost {
		if filereadable(expand('local.gdbinit')) 
			call TermDebugSendCommand('source '.. expand('local.gdbinit'))
		else
			call mytermdebug#Vimdebug()
		endif
	}
augroup END

command! DebugFailedDumps call mytermdebug#InspectFailedDumps()
