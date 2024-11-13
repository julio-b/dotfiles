let g:loaded_spellfile_plugin = 1

augroup elSpellfile
	au!
	au SpellFileMissing el echom "Generating " .. expand("<amatch>") .. " spellfile.."
	au SpellFileMissing el !make --directory=$MYVIMDIR/spell
augroup END
