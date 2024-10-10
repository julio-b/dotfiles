start := \
	https://github.com/junegunn/vim-easy-align.git \
	https://github.com/mbbill/undotree.git \
	https://github.com/tpope/vim-fugitive.git \
	https://github.com/tpope/vim-rhubarb.git \
	https://github.com/junegunn/fzf.vim.git \
	https://github.com/lervag/vimtex.git \

opt := \
	https://github.com/yegappan/lsp.git \

colorscheme_start := \
	https://github.com/vim/colorschemes.git

colorscheme_opt := \
	https://github.com/mcchrish/zenbones.nvim.git


PLUGIN_DIR := plugins

$(PLUGIN_DIR)_start := $(start)
$(PLUGIN_DIR)_opt := $(opt)

va := $(filter %_start,$(.VARIABLES))
va += $(filter %_opt,$(.VARIABLES))

DIRS := $(foreach v, $(va), $(addprefix $(subst _,/,$(v))/,$(basename $(notdir $($(v))))))
ALLURLS := $(foreach v, $(va), $($(v)))

.PHONY : install
install: $(DIRS)
	vim -c 'helptags ALL' -c q

$(DIRS): | $(subst _,/,$(va))
	git clone --depth 1 -- $(firstword $(filter %$(notdir $@).git, $(ALLURLS))) $@

$(subst _,/,$(va)):
	mkdir -p $@

.DEFAULT_GOAL := pull
.PHONY : pull
pull:
	find . -mindepth 3 -maxdepth 3 -type d -print0 | xargs -0 -P 0 -I '{}' git -C '{}' pull
	vim -c 'helptags ALL' -c q

# Use literal '%' in recipe
PERCENT := %

# A simple log viewer to review the latest pulled commits
.PHONY : log
log:
	@find . -mindepth 3 -maxdepth 3 -type d -exec bash -c '[[ $$(git -C "$$0" rev-list --count HEAD@{yesterday}..HEAD) -gt 0 ]] && echo "$$0"' '{}' \; \
		| fzf --exit-0 --disabled --reverse --height=~100$(PERCENT) --preview-window "down,85$(PERCENT),hidden" \
			--preview "git -C {} log --pretty=tree -p --reverse --color=always HEAD@{yesterday}..HEAD" \
			--bind 'enter:execute(GIT_PAGER="less -+F" git -C {} log --pretty=tree -p --reverse HEAD@{yesterday}..HEAD)' \
			--bind ctrl-q:accept,ctrl-v:toggle-preview \
			--bind ctrl-y:preview-up,ctrl-e:preview-down \
			--bind ctrl-b:preview-page-up,ctrl-f:preview-page-down \
			--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down \
		|| exit 0
