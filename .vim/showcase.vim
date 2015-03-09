" - Enable syntax options for hightlights
syntax on
syntax enable

" - Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" - Enable column number, ruler, cursor
set number
set ruler
set cursorline
set gcr=a:block-blinkon0

" - Turn on folding
set foldenable
set foldmethod=marker
set foldlevel=100
set foldopen=block,hor,mark,percent,quickfix,tag

" - Disable mouse
set mouse-=a
set mousehide

" - Match bracket
set showmatch
set matchtime=5

" - Show command
set scrolloff=3
set showcmd
set shortmess=atI " Shortens messages
