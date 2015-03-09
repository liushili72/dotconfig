" - Modify coding source
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  " setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

set wildmenu
set wildmode=longest:full,full
set nrformats=alpha,octal,hex

" - Enable modeline configurations
set modeline
set modelines=5

" - Share the pasteboard with system
set clipboard+=unnamed
set pastetoggle=<F12>

" - Sets how many lines of history VIM has to remember
set history=700

" - Set to auto read when a file is changed from the outside
set autoread

" - More powerful backspace
set backspace=2
set backspace=indent,eol,start

" - Move to several lines
set whichwrap=h,l

" - Indenting related options
set autoindent
set smarttab
set expandtab
set smartindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround

set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

" - Search options
set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault

" - Formatting mode
set fo-=o
set fo-=r
set fo-=t

nnoremap <F12> :set invpaste paste?<CR>
imap <F12> <C-O>:set invpaste paste?<CR>
