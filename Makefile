PWD := $(shell pwd)

.FORCE:

clean:
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/.zshconfig
	rm -rf ~/.zshrc
	rm -rf ~/.zshenv

restart:
	exec zsh

vim_link:
	ln -s $(PWD)/.vim ~/.vim
	ln -s $(PWD)/.vimrc ~/.vimrc

zsh_mkdir:
	mkdir ~/.zshconfig

zsh_link:
	ln -s $(PWD)/.oh-my-zsh ~/.zshconfig/.oh-my-zsh
	ln -s $(PWD)/.zsh-custom ~/.zshconfig/.zsh-custom
	ln -s $(PWD)/.zshrc ~/.zshrc
	ln -s $(PWD)/.zshenv ~/.zshenv

init:
	git submodule update --init

update:
	git submodule foreach "(git checkout master; git pull)"

love: clean vim_link zsh_mkdir zsh_link restart
