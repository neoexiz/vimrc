" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.  "set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
if has("gui_running")
	set background=dark
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

let mapleader=","
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd   " Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden        " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set fileencodings=utf-8,bg18030,gbk,big5 "Set fileencodings
set nocompatible	" No compatible with vi
let g:solarized_termcolors=256
"colorscheme molokai	" Color with molokai/solarized
set ruler
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

set magic
set backspace=2
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
"set expandtab

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set autoindent
set nobackup
set ignorecase smartcase
set incsearch
set hlsearch
set guioptions-=T
set guioptions-=m
set smartindent
set foldenable
set foldmethod=syntax
set number

" Vundle setup
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle Plugin
Bundle 'gmarik/vundle'
Bundle 'NERD_tree-Project'
Bundle 'scrooloose/syntastic'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'majutsushi/tagbar'
Bundle 'The-NERD-tree'
Bundle 'molokai'
Bundle 'ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'christoomey/vim-run-interactive'
" Code Compeletement
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" make YCM compatible with UltiSnips (Using supertab)
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:SuperTabDefaultCompletionType = '<C-n>'

" Plugin molokai
set t_Co=256
if ($t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

syntax enable "Javascript syntax hightlight
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

colorscheme molokai
highlight NonText guibg=#060606
highlight Folded guibg=$0A0A0A guifg=#9090D0

" Plugin The-NERD-tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$','\.pyc$','\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") |q| endif
" Open a NERDTree
nmap <F5> : NERDTreeToggle<cr>

" Plugin Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/usr/bin/ctags'
nmap <F6> : TagbarToggle <cr>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" Plugin ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*jpeg,*.gif "MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use Ag in ctrlp for listing files.
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	" Ag is fast enough that ctrlp doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" Plugin vim-powerline
set laststatus=2 "Always display the status line
set statusline+=%{fugitive#statusline()} " Git hotness

" Plugin christoomey/vim-run-interactive
nnoremap <Leader>r :RunInInteractiveShell<space>

" Plugin scrooloose/syntastic
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Plugin YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Leader set
nmap <leader>w :w<cr>
nmap <leader>e :tabe<space>
nmap <leader>o :e<space>
nmap <leader>q :q<cr>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

