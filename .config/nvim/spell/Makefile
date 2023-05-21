all: el.utf-8.spl

el.utf-8.spl : el_GR.dic el_GR.aff
	#nvim --clean --cmd "mkspell! el el_GR" --cmd q
	##NOTE: neovim has a weird bug right now and will not produce this spellfile correctly, use vim instead
	/usr/bin/vim --clean --cmd "mkspell! el el_GR" --cmd q

el_GR.aff: el_GR.diff
	curl -Lo el_GR.aff https://github.com/wooorm/dictionaries/raw/main/dictionaries/el/index.aff
	patch < el_GR.diff

el_GR.dic:
	curl -Lo el_GR.dic https://github.com/wooorm/dictionaries/raw/main/dictionaries/el/index.dic

.PHONY: clear
clear:
	rm el_GR.{aff,dic} el.utf-8.{spl,sug}

.PHONY: clean
clean:
	rm el.utf-8.{spl,sug}


# NOTE:
# el_GR.diff downloaded from https://github.com/vim/vim/blob/master/runtime/spell/el/el_GR.diff
# updated to utf-8 and modified for current version of el_GR.aff
# needed for generating .sug file
