let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-flow',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-styled-components',
  \ 'coc-stylelintplus',
  \ 'coc-svg',
  \ 'coc-tsserver',
  \ 'coc-rls',
  \ 'coc-rust-analyzer',
  \ 'coc-graphql'
  \ ]

call plug#begin('~/.vim/plugged')

Plug '~/my-prototype-plugin'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
Plug 'tpope/vim-fugitive'
Plug 'camspiers/lens.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

set termguicolors
set t_Co=256
set background=light
colorscheme PaperColor

set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set number
set cursorline
syntax on
set laststatus=2
set hlsearch
set incsearch
set updatetime=1000

" switch splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" save on ctrl-s
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

" exit insert mode
inoremap jj <Esc>

" colorizer
let g:colorizer_auto_color = 1

" quit on ctrl-q
nmap <c-q> :q<cr>
imap <c-q> <esc>:q<cr>

" allow for the removal of characters directly after entering the edit mode
set backspace=indent,eol,start

" theme
let g:airline_theme='papercolor'

" fzf
map <C-p> :GFiles --cached --others --exclude-standard<CR>

" NERDTree
map <C-x> :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gf :Gdiff<CR>
nnoremap <space>n :noh<CR>

" coc.nvim
nmap <silent><space>gd <Plug>(coc-definition)
nmap <silent><space>gi <Plug>(coc-implementation)
nmap <silent><space>gt <Plug>(coc-type-definition)
nmap <silent><space>gr <Plug>(coc-references)
nnoremap <silent><space>d :call <SID>show_documentation()<CR>
nnoremap <silent><space>o :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nmap <space>r <Plug>(coc-rename)
vmap <space>f  <Plug>(coc-format-selected)
xmap <space>f  <Plug>(coc-format-selected)
nmap <space>f  <Plug>(coc-format-selected)
nmap <space>s :CocSearch 
nnoremap <silent> <space>e :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>m :<C-u>CocList -I symbols<cr>
nmap <space>y  <Plug>(coc-codeaction)
xmap <space>a  <Plug>(coc-codeaction-selected)
nmap <space>a  <Plug>(coc-codeaction-selected)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

hi Search ctermbg=LightYellow
let g:NERDTreeNodeDelimiter = "\u00a0"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

filetype plugin on

let &t_SI="\033[5 q" " start insert mode
let &t_EI="\033[1 q" " end insert mode

" color column
" set colorcolumn=101

" spell checker
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

set timeoutlen=1000 ttimeoutlen=0
