let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-flow',
  \ 'coc-graphql',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-rls',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-styled-components',
  \ 'coc-stylelintplus',
  \ 'coc-svg',
  \ 'coc-tsserver'
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
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector'

" Initialize plugin system
call plug#end()

set termguicolors
set t_Co=256
set background=light
colorscheme one
let g:one_allow_italics = 1

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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

" airline
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1

" fzf
map <C-p> :GFiles --cached --others --exclude-standard<CR>

" NERDTree
nnoremap <space>tn :NERDTree<CR>
nnoremap <space>tt :NERDTreeToggle<CR>
nnoremap <space>tf :NERDTreeFind<CR>
let NERDTreeShowHidden=1

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

" tagbar
nnoremap <space>gy :TagbarToggle<CR>

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:gitgutter_sign_priority = 1
let g:gitgutter_sign_allow_clobber = 1

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
