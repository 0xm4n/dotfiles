"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic editing config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " not vi compatible
filetype off
syntax on                       " enable syntax processing
set showmatch                   " highlight matching [{()}]
set number                      " number lines
set laststatus=2                " Show the status line at the bottom
set path+=**
set backspace=indent,eol,start  " allow backspacing over everything
set hidden                      " allow auto-hiding of edited buffers
set noerrorbells visualbell t_vb= " disable audible bell
set ignorecase                  " ignore case in searches by default
set smartcase                   " but make it case sensitive if an uppercase is entered
set mouse+=a                    " enable mouse mode (scrolling, selection, etc)
set hlsearch                    " highlight search
set incsearch                   " incremental search (as string is being typed)
set autoindent			" copy indent from current line when starting a new line
set cindent			" enables automatic C program indenting.
set title
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
set wildmenu                    " visual autocomplete for command menu
set splitbelow                  " open new vertical split bottom
set splitright                  " open new horizontal splits right
set colorcolumn=80		" highlight column 80
set updatetime=350		" delays
set signcolumn=yes		" Always show the signcolumn
set pumheight=10		" number of suggestions
set scrolloff=8			" minimal number of screen lines to keep above and below the cursor
set sidescrolloff=8		" minimal number of screen columns either side of cursor if wrap is `false`
let g:c_syntax_for_h=1		" for *.h files use C syntax instead of C++

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'
" Theme
Plug 'sainnhe/sonokai'
" Navigate and highlight matching words
Plug 'andymass/vim-matchup'
" Subtitute paste
Plug 'svermeulen/vim-subversive'
" Bookmark
Plug 'MattesGroeger/vim-bookmarks'
" Clipboard : copy into system clipboard
Plug 'ojroques/vim-oscyank'				
" Move lines and selections up and down
Plug 'matze/vim-move'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git
Plug 'tpope/vim-fugitive'
" Git commit message
Plug 'rhysd/git-messenger.vim' 			
" Shows git diff markers in the sign column
Plug 'airblade/vim-gitgutter'				
" Comment code
Plug 'tpope/vim-commentary'
" Auto-pairs
Plug 'jiangmiao/auto-pairs'
" Tag outline viewer
Plug 'preservim/tagbar'
" File system explorer
Plug 'preservim/nerdtree'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" LSP
Plug 'prabirshrestha/vim-lsp'
" LSP-autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'keremc/asyncomplete-clang.vim'
" Theme
Plug 'sainnhe/sonokai'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" !!!
" !!! leader is space !!!
let mapleader=" "

" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Jump to start and end of line using the home row keys
map H ^
map L $

" Keep next in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" Split with leader
nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vsp<CR>

" Indent code block
vnoremap < <gv
vnoremap > >gv

" Quick Save & Quit
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Cscope update database
nmap <F5> :!cscope -Rb<CR>:cs reset<CR><CR>

" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Yank to system clipboard
nmap <leader>y <Plug>OSCYankOperator
nmap <leader>yy <leader>c_
vmap <leader>y <Plug>OSCYankVisual

" Replace with  vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" fzf.vim
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :Rg<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fs :GFiles?<CR>
nnoremap <silent> <leader>fd :BLinesp<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <leader>gt :Rg <C-R><C-W><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
endif

" Close vim if only window left is quickfix
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#lsp#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#branch#prefix     = '⤴'
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'

let g:airline_theme = 'sonokai'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

" 24-bit color terminal support 
if (has("termguicolors"))
	set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1

colorscheme sonokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_layout = { 'down': '~40%' }

let g:fzf_action = {
  \ 'ctrl-q': 'fill_quickfix',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" BLine with preview
command! -bang -nargs=* BLinesp
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-lsp 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
    augroup end
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lsp autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

autocmd User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#clang#get_source_options())

