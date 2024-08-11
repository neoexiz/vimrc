" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those 
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim 
" will be overwritten everytime an upgrade of the vim packages is performed.  
" It is recommended to make changes after sourcing debian.vim since it alters 
" the value of the 'compatible' option.  
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.  runtime! debian.vim

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

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Color
Plug 'junegunn/seoul256.vim'

" Nocompatible with vi
Plug 'tpope/vim-sensible'

" Syntax
Plug 'dense-analysis/ale'

" Tree
Plug 'preservim/nerdtree'

" Complete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Status line
Plug 'vim-airline/vim-airline'

call plug#end()

" Color schemes should be loaded after plug#end().
" We prepend it with 'silent!' to ignore errors when it's not yet installed.
silent! colorscheme seoul256

" Brief help
" :PlugInstall to install the plugins
" :PlugUpdate to install or update the plugins
" :PlugDiff to review the changes from the last update
" :PlugClean to remove plugins no longer in the list

let g:coc_disable_startup_warning = 1

" let mapleader=";"

" set showcmd
" set hidden
" set mouse=a
" set fileencodings=utf-8,bg18030,gbk,big5
" set textwidth=80
" set wildmenu
" set ruler
" set cursorline 
" set cursorcolumn
" set magic
" set backspace=2
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set shiftround
" set expandtab
" set colorcolumn=+1
" set autoindent
" set nobackup
" set ignorecase
" set smartcase
" set incsearch
" set hlsearch
" set smartindent
" set foldenable
" set foldmethod=syntax
" set number


" Plugin 'fcitx.vim'
" Plugin 'ctrlp.vim'
" Plugin 'christoomey/vim-run-interactive'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'kshenoy/vim-signature'
" Plugin 'ervandew/supertab'
" Plugin 'honza/vim-snippets'

