set runtimepath+=~/.vim
runtime autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
syntax on

set hidden
set number
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
syntax on
command! Status echo "All systems are go!"
