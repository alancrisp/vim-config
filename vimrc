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
set autoindent

filetype plugin indent on

nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s
set splitbelow
set splitright

autocmd FileType php set iskeyword+=$

"au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Colorscheme
set termguicolors
colorscheme gruvbox

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
let g:ale_php_phpstan_executable='vendor/bin/phpstan'
let g:ale_php_phpstan_configuration='phpstan.neon'

" Closetag plugin
let g:closetag_filenames = '*.html,*.tpl,*.twig'

" Ag
if executable('ag')
"  "let g:ackprg='ag --nogroup --nocolor --column'
  let g:ackprg='ag -U --vimgrep --path-to-ignore ~/.ignore'
  let g:ctrlp_user_command='ag %s -U -l --nocolor -g "" --path-to-ignore ~/.ignore'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" FZF
noremap <silent> <leader>f :Lines<CR>
noremap <silent> <leader>g :GFiles<CR>
noremap <silent> <leader>p :Files<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Visual'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'StatusLineNC'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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
    \"/app": getcwd()
\}

"CoC
" Select range based on AST
nmap <silent><Leader>r <Plug>(coc-range-select)
xmap <silent><Leader>r <Plug>(coc-range-select)
" Navigations
nmap <Leader>o <Plug>(coc-definition)
nmap <Leader>O <Plug>(coc-type-definition)
nmap <Leader>I <Plug>(coc-implementation)
nmap <Leader>R <Plug>(coc-references)
" List code actions available for the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)
" Use <CR> to validate completion (allows auto import on completion)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Hover
nmap K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Text objects for functions and classes (uses document symbol provider)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
autocmd CursorHold * silent call CocActionAsync('highlight')

