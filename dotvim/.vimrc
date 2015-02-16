"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Benjamin Huang
"
" Version:
"       1.0
"
" Blog:
"       http://www.benjihuang.com
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Global configuration
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" + First of all, enabal pathogen plugins to manage all plugins
filetype off
execute pathogen#infect()

" - Enable filetype options
filetype plugin indent on

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Graphic user interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Theme - Gruv Box
set splitbelow
set splitright

if !has("gui_running")
   let g:gruvbox_italic=0
   let g:gruvbox_termcolors=16
endif

try
  set background=dark
  colorscheme gruvbox
catch /E185:/
  colorscheme default
endtry

" Theme - Molokai
" set splitbelow
" set splitright
" set t_Co=256
" let g:molokai_original = 1
"
" if has('gui_running')
"   let g:rehash256 = 1
" endif
"
" try
"   set background=dark
"   colorscheme molokai
" catch /E185:/
"   colorscheme default
" endtry

" Theme - Solarized
" let g:solarized_termcolors=16
" let g:solarized_termtrans=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"

" try
"   set background=dark
"   colorscheme solarized
" catch /E185:/
"   colorscheme default
" endtry"

" if exists('g:colors_name') && g:colors_name == 'solarized'
"   if has('gui_macvim')
"     set transparency=0
"   endif
"   if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
"     let g:solarized_termtrans = 0
"     let g:solarized_bold=1
"     let g:solarized_underline=1
"     let g:solarized_italic=1
"     let g:solarized_contrast="normal"
"     let g:solarized_visibility="normal"
"     colorscheme solarized
"   endif
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins option
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDChristmasTree=1
" let g:NERDTreeQuitOnOpen=1
" let g:NERDTreeMinimalUI=1
" let g:NERDShowBookMarks=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: NEOComplete [requeire vim 7.4+]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#enable_auto_select = 1
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
\ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: NEOSnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: Vim-Javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set regexpengine=1
let g:javascript_enable_domhtmlcss=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin: Indent-Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '|'
" let g:indentLine_color_tty_light = 7
" let g:indentLine_color_dark = 1
