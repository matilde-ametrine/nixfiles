set nocompatible

if !filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
    silent call mkdir(expand("~/.vim/bundle", "p"))
    silent execute "!git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim"
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'LnL7/vim-nix'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

call vundle#end()
filetype plugin indent on

let g:netrw_dirhistmax = 0

set autochdir
set backupdir=~/.cache/vim/swap//
set backupskip=/tmp/*,/private/tmp/*
set belloff=all
set cinkeys=
set cursorline
set directory=~/.cache/vim/swap//
set encoding=utf-8
set expandtab
set foldmethod=syntax
set formatoptions=q
set lazyredraw
set mouse=a
set nohlsearch
set nojoinspaces
set noruler
set nowrap
set number
set numberwidth=6
set scrolloff=9999
set shiftwidth=4
set softtabstop=4
set spelllang=en_us
set splitbelow
set splitright
set t_ZH=
set t_ZR=
set tabstop=4
set textwidth=79
set title
set viminfo=
set wildmenu
set wildmode=longest:full,full

silent call mkdir(expand(&backupdir, "p"), "p")

colorscheme nord
autocmd ColorScheme * hi clear CursorLine
autocmd ColorScheme * hi CursorLineNr ctermfg=03
syntax on

autocmd BufRead,BufNewFile * syntax match Shebang "^#!.*"
hi link Shebang PreProc

hi clear Conceal
hi Underlined cterm=underline ctermfg=6 gui=underline guifg=#88C0D0
