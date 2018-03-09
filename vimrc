set number
set hlsearch
set expandtab
set softtabstop=4
set shiftwidth=4
set list
set listchars=tab:>-
set laststatus=2
set ts=4
set scrolloff=5
set bg=light

filetype plugin indent on

call pathogen#infect()

au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile .arc* set filetype=json

" Trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Sort_Type = 'name'
"let Tlist_Exit_OnlyWindow = 1
autocmd BufRead,BufNewFile * let tlist_php_settings = 'php;c:class;f:function;d:constant;i:interface'
"autocmd BufWritePost * :TlistUpdate "possibly not required due to easytags

" Legacy codebases
autocmd BufRead,BufNewFile ~/repos/gen1/* set noexpandtab
autocmd BufRead,BufNewFile ~/repos/gen2/* set noexpandtab
autocmd BufRead,BufNewFile ~/repos/vms/* set noexpandtab
autocmd BufRead,BufNewFile ~/repos/ukwh/* set noexpandtab
autocmd BufRead,BufNewFile ~/repos/gen1/*,~/repos/gen2/*,~/repos/ukwh/* let b:syntastic_mode='passive'
autocmd BufRead,BufNewFile ~/repos/gen1/*/index.html set syntax=php
autocmd BufRead,BufNewFile ~/repos/gen1/*/*.mysql set syntax=php
autocmd BufRead,BufNewFile ~/repos/gen2/*/*.inc set syntax=php

" Tags
"autocmd BufRead,BufNewFile ~/repos/gen1/* set tags=~/repos/gen1/.tags
"autocmd BufWritePost * :!generate-ctags.sh
let g:easytags_opts = ['--exclude=.git --exclude=composer.phar']
let g:easytags_async = 1

" Fix nolist being set when switching buffers with bufexplorer
au BufEnter,BufNew,BufRead,BufNewFile * set list

" Rubocop
let g:syntastic_ruby_rubocop_exec = '~/.vim/rubocop-system'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Logstash
autocmd BufRead,BufNewFile ~/repos/logstash-conf/components/*conf set ft=logstash

" Closetag plugin
let g:closetag_filenames = '*.html,*.tpl,*.twig'

" Ag
if executable('ag')
"  "let g:ackprg='ag --nogroup --nocolor --column'
  let g:ackprg='ag --vimgrep'
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif

" Neocomplete
let g:neocomplete#enable_at_startup = 1
