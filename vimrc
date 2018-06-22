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
set autoindent

filetype plugin indent on

call pathogen#infect()

"au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Sort_Type = 'name'
"let Tlist_Exit_OnlyWindow = 1
autocmd BufRead,BufNewFile * let tlist_php_settings = 'php;c:class;f:function;d:constant;i:interface'
autocmd BufRead,BufNewFile * let tlist_sql_settings = 'sql;t:table;F:field'

" Tags
let g:easytags_opts = ['--exclude=.git --exclude=composer.phar']
let g:easytags_async = 1

" Fix nolist being set when switching buffers with bufexplorer
au BufEnter,BufNew,BufRead,BufNewFile * set list

" Rubocop
let g:syntastic_ruby_rubocop_exec = '~/.vim/rubocop-system'
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2

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

" PHPCS
let g:syntastic_php_phpcs_args='--standard=PSR2'

" VCSV
" Arrange on load
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024
