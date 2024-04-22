function s:Vimdebug()
	" do nothing if we are not debugging vim
	if getcwd() !~? '\v.*/projects/vim(/src)='
		return
	endif
	let gdbinit =<< eval trim END
		define saveb
		save breakpoints breakpoints.gdb
		end
		document saveb
		Use saveb to save breakpoints to ./breakpoints.gdb, they are restored automatically
		end
		#
		server set environment VIMRUNTIME={substitute(getcwd(),'/src$','','')}/runtime
		server set args --clean
		{filereadable('breakpoints.gdb')? '' : '# '}server source breakpoints.gdb
		show args
		help saveb
	END
	" catch syscall close
	" catch signal SIGWINCH
	" condition N (int)$rds == -1
	let tmpfile = tempname()
	call writefile(gdbinit, tmpfile)
	call TermDebugSendCommand('source ' .. tmpfile)
endfunction

augroup termdebug/autogdbinit
	au!
	au User TermdebugStartPost {
		if filereadable(expand('local.gdbinit')) 
			call TermDebugSendCommand('source '.. expand('local.gdbinit'))
		else
			call s:Vimdebug()
		endif
	}
augroup END

function s:InspectFailedDumps()
	let testdirs = ['~/p/vim/src/testdir/failed/', '~/p/vim/runtime/syntax/testdir/failed/']
	let faileddumps = globpath(testdirs->join(','), '*.dump', 1, 1)
	if len(faileddumps) == 0
		echohl ErrorMsg
		echom "Can't find any failed screendumps"
		echohl None
		return
	endif
	for d in faileddumps
		tab call term_dumpdiff(d, d->substitute('testdir\/failed', 'testdir\/dumps',''))
		setlocal nolist nowrap
	endfor
endfunction

command! DebugFailedDumps call s:InspectFailedDumps()

" augroup termdebug/vimsrc
" 	au!
" 	au DirChanged global,tabpage {
" 		echom expand('<afile>')
" 		if expand('<afile>') =~? '\v.*/projects/vim(/src)='
" 			packadd termdebug
" 			command! Debugvim Termdebug ./src/vim<CR>
" 		endif
" 	}
" augroup END
