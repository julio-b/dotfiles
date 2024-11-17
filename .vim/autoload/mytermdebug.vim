function mytermdebug#Vimdebug()
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
		server set environment VIM=/usr/share/vim
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

function mytermdebug#InspectFailedDumps()
	let testdirs = ['~/p/vim/src/testdir/failed/', '~/p/vim/runtime/syntax/testdir/failed/']
	let faileddumps = globpath(testdirs->join(','), '*.dump', 1, 1)
	if len(faileddumps) == 0
		echohl ErrorMsg
		echom "Can't find any failed screendumps"
		echohl None
		return
	endif
	for d in faileddumps
		try
			tab call term_dumpdiff(d, d->substitute('testdir\/failed', 'testdir\/dumps',''))
		catch /^Vim(\a\+):E485: Can't read file .*\/testdir\/dumps\/.*/
			tab call term_dumpdiff(d, '/dev/null')
		endtry
		setlocal nolist nowrap
	endfor
endfunction

