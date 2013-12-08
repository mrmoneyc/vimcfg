PWD=`/bin/pwd`
VIM_BAK_DIR='.vim'

all: init util postInstall
	@echo '-- DONE! --'

init:
	@echo '-- INSTALL NEOBUNDLE --'
	@git clone git://github.com/Shougo/neobundle.vim $(PWD)/bundle/neobundle.vim

util:
	@echo '-- INSTALL VIM SETTING --'
	@ln -fs $(PWD)/_vimrc $(HOME)/.vimrc
	@ln -fs $(PWD)/_gvimrc $(HOME)/.gvimrc
	@vim -c 'NeoBundleInstall' -c 'qa'

postInstall:
	@echo '-- COMPILE VIMPROC  --'
	@$(PWD)/util.sh postInstall

update:
	@echo '-- UPDATE NEOBUNDLE & PLUGINS --'
	@$(PWD)/util.sh update
	@vim -c 'NeoBundleUpdate' -c 'qa'

backup:
	@echo '-- BACKUP VIM SETTING --'
	@mkdir $(VIM_BAK_DIR)
	@cp -R {Makefile,util.sh,README.mkd,_gvimrc,_vimrc,colors,vimswap} $(VIM_BAK_DIR)
	@tar zcvf $(HOME)/vim_config.tar.gz $(VIM_BAK_DIR)
	@rm -rf $(VIM_BAK_DIR)
	@echo '-- DONE! --'
