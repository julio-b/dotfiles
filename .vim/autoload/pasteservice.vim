function! pasteservice#p0x0st() range
	let curl = systemlist(
			\"curl -iF 'file=@-' https://0x0.st",
			\ getline(a:firstline, a:lastline)
		\)->map({_, val -> substitute(val, '\r$', '', '')})

	echohl Comment
	call foreach(curl, 'echo v:val')
	echohl None
	
	let @* = curl[-1]
	let @+ = curl[-1]

	echohl WarningMsg
	call filter(curl, 'v:val =~# "^X-Token"')->map({_, val ->
		\ 'To delete use: curl -Fdelete= -Ftoken='
		\   .. substitute(val, '^.*: \(.*\)$', '\1 ', '')
		\   .. @+
		\})->foreach('echomsg v:val')
	echohl None

	display +*
endfunction
