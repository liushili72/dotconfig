init:
	git submodule update --init

update:
	git submodule foreach "(git checkout master; git pull)"

love:
	ln -s $$HOME/.dotconfig/dotvim/.vim $$HOME/.vim
	ln -s $$HOME/.dotconfig/dotvim/.vimrc $$HOME/.vimrc
	ln -s $$HOME/.dotconfig/dotzsh/.zshrc $$HOME/.zshrc
	ln -s $$HOME/.dotconfig/dotzsh/.zshenv $$HOME/.zshenv
