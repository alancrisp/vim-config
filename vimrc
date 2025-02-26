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

nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s
set splitbelow
set splitright

"au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Legacy codebases
autocmd BufRead,BufNewFile ~/repos/uac* let b:ale_enabled = 0
autocmd BufWritePre ~/repos/uac* let b:noStripWhitespace = 1
autocmd BufRead,BufNewFile ~/repos/myaccount* let b:ale_enabled = 0

" Trim trailing whitespace
autocmd BufWritePre * call StripTrailingWhitespace()
fun! StripTrailingWhitespace()
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

" Taglist
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Sort_Type = 'name'
"let Tlist_Exit_OnlyWindow = 1
autocmd BufRead,BufNewFile * let Tlist_Use_Right_Window = 1
autocmd BufRead,BufNewFile * let tlist_php_settings = 'php;c:class;f:function;d:constant;i:interface'
autocmd BufRead,BufNewFile * let tlist_sql_settings = 'sql;t:table'
:command TL TlistToggle

" Tags
let g:easytags_opts = ['--exclude=.git --exclude=composer.phar']
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_python_enabled = 1

" Fix nolist being set when switching buffers with bufexplorer
au BufEnter,BufNew,BufRead,BufNewFile * set list

" Ale
let g:ale_php_phpcs_standard='PSR12'

" Closetag plugin
let g:closetag_filenames = '*.html,*.tpl,*.twig'

" Ag
if executable('ag')
"  "let g:ackprg='ag --nogroup --nocolor --column'
  let g:ackprg='ag -U --vimgrep --path-to-ignore ~/.ignore'
  let g:ctrlp_user_command='ag %s -U -l --nocolor -g "" --path-to-ignore ~/.ignore'
  "let g:ctrlp_user_command=['.git/', 'git ls-files --cached --others  --exclude-standard %s']
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" NERDTree
let NERDTreeMapActivateNode='<space>'
:command NE NERDTreeToggle

" Caps lock
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
autocmd InsertLeave * set iminsert=0

" PHP Manual (requires pman)
autocmd FileType php set keywordprg=pman

" Lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
if !has('gui_running')
  set t_Co=256
endif

" UltiSnips
let g:UltiSnipsEnableSnipMate=1

" Vdebug
if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9003
let g:vdebug_options.ide_key = 'DEBUG'
let g:vdebug_options.path_maps = {
    \"/app": getcwd(),
    \"/usr/share/uac": "/home/acrisp/repos/uac",
    \"/usr/share/provdb": "/home/acrisp/repos/provdb",
    \"/usr/share/myaccount": "/home/acrisp/repos/myaccount"
\}
