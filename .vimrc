""""""""""""""""""""""""""""""""""""""""""""
" pathogen
""""""""""""""""""""""""""""""""""""""""""""
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin on
filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""""
"" latex-suite
""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=/usr/share/vim/addons
set grepprg=grep\-nH\$*
let g:tex_flavor='latex'

""""""""""""""""""""""""""""""""""""""""""""
"" vim-dvi
""""""""""""""""""""""""""""""""""""""""""""
:map \ld :execute '!xdvi -editor "vim --servername 'v:servername' --remote +\%l \%f" -sourceposition ' . line(".") . expand("%") . " '" . expand(Tex_GetMainFileName(':r')) . ".dvi' >/dev/null&" <CR><CR>

""""""""""""""""""""""""""""""""""""""""""""
"" Tag Bar - Code outline viewer
""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""
"" Task List
""""""""""""""""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList

""""""""""""""""""""""""""""""""""""""""""""
"" Neocomplete - OmniCompletion
""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic
""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8','pylint']
let g:syntastic_python_flake8_args = "--max-line-length=100" 
"let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

""""""""""""""""""""""""""""""""""""""""""""
"" General
""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=700		" set command history
set autoread		" autoread when a file is changed from outside
set showmode		" show current mode
set mouse=a			" use mouse
set foldmethod=indent " set fold method by syntax (requires file in ~/.vimrc/syntax)

""""""""""""""""""""""""""""""""""""""""""""
"" VIM interface
set so=3			" set 7 lines to the cursor when moving vertical
set wildmenu        " turn on Wild menu
set ruler			" show current position
set hidden			" change buffers without saving
set backspace=eol,start,indent	" backspace config
set ignorecase		" ignore case when searching
set smartcase		" ?
set hlsearch		" highlight search results
set incsearch		" incremental search
set showmatch		" match brackets
set mat=2			" tenths of a second to show match
set noerrorbells 	" no sounds for errors
set novisualbell	" no visual sounds for errors
set number

""""""""""""""""""""""""""""""""""""""""""""
"" Colors & Fonts
""""""""""""""""""""""""""""""""""""""""""""
syntax enable
" Color Scheme (only if GUI running)
if has("gui_running")
     set background=light
     "     colorscheme ron
else
     set background=dark
     colorscheme slate
     " autocmd FileType python colorscheme solarized
endif

"""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indents
"""""""""""""""""""""""""""""""""""""""""""
set expandtab		" make tabs spaces
set shiftwidth=4	" use indents of 4 spaces
set tabstop=4		" indent 4 columns
set smarttab		
set autoindent 		" indent same level as previous line
set smartindent		" indent according to syntax
set more
set linespace=0		" no spaces between rows

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

"""""""""""""""""""""""""""""""""""""""""""
" File specific commands
"""""""""""""""""""""""""""""""""""""""""""
autocmd FileType py setlocal shiftwidth=4 tabstop=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2

"""""""""""""""""""""""""""""""""""""""""""
" Viewport controls
"""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-w>h
let g:BASH_Ctrl_j = 'off'
noremap <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""
" Useful maps
"""""""""""""""""""""""""""""""""""""""""""
noremap <leader>tt :noautocmd vimgrep /TODO/j **/*<CR>:cw<CR>

"""""""""""""""""""""""""""""""""""""""""""
" Save and load file revision state (like folding)
"""""""""""""""""""""""""""""""""""""""""""
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

"""""""""""""""""""""""""""""""""""""""""""
" Mark spaces at end of line
"""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""
" Set the encoding
"""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

