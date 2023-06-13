vim.api.nvim_create_user_command('ST',
	[[<line1>,<line2>w !curl -F 'file=@-' https://0x0.st | tr -d '\n' | xclip -i -selection clipboard]],
	{
		desc = "Pasteservice 0x0.st",
		range = '%',
	})
