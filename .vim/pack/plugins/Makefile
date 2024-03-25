.PHONY : all
all:
	find . -mindepth 2 -maxdepth 2 -type d -print0 | xargs -0 -P 4 -I '{}' git -C '{}' pull
	vim -u NONE -c "helptags ALL" -c q


