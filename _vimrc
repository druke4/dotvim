" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Disable audible bell and screen flashing bell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position in lower right corner all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

set autoindent      " autoindent
set autoread        " Automatically update files if changed outside of Vim
set number          " Show line numbers
set cursorline      " Highlight the current line
set nowrap          " Don't wrap lines at the edge of the screen

set tabstop=4       " Tabs are 4 spaces each
set expandtab       " Type spaces when the Tab key is pressed
set shiftwidth=4    " Indent 4 spaces
set smarttab        " Treat shiftwidth spaces as a 'virtual tab' on empty lines.
                    " i.e. one backspace press will remove shiftwidth spaces and
                    " one tab press will insert shiftwidth spaces
set shiftround      " Round shift operators '>' and '<' to a multiple of shiftwidth
set cindent         " Use C indentation rules
set cinoptions=f0,{s,(s,>s,^-s,U1   " Rules for indenting according to the Garmin C
                                    " coding standard

set hlsearch        " Highlight matching search terms
set showmode        " Show new mode when switching
syntax enable       " Enable syntax highlighting
