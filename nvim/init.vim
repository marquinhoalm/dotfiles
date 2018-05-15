 " ##### Fix vim with fish  {{{

if &shell =~# 'fish$'
    set shell=sh
endif

" "}}}

" Plugins
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
Plug 'roxma/nvim-completion-manager'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-fugitive'
Plug 'ton/vim-bufsurf'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-highlightedyank'
Plug 'edkolev/tmuxline.vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'chriskempson/base16-vim'
Plug 'thaerkh/vim-indentguides'
Plug 'dracula/vim'

call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
" The encoding displayed.
set encoding=utf-8
" The encoding written to file.
set fileencoding=utf-8
" Enable syntax highlight
syntax on

set background=dark
colorscheme tender

let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\ 'typescript': ['tslint', 'tsserver'],
			\ 'go': ['gofmt -e', 'go vet', 'golint', 'gosimple', 'staticcheck'],
			\ 'python': ['flake8']
			\ }

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0

let g:ale_python_flake8_options = '--ignore=E501'

" ##### vim-tmuxline.vim {{{
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_preset = {
  \'a'    : '%d %b %Y %H:%M',
  \'b'    : '#W',
  \'win'  : '#I #W',
  \'cwin' : '#I #W',
  \'z'    : '#h'}
" }}}


" ##### Airline  {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'tender'
let g:airline_section_warning = ''
let g:airline_inactive_collapse = 0
let g:airline#extensions#default#section_truncate_width = {
  \ 'a': 60,
  \ 'b': 80,
  \ 'x': 100,
  \ 'y': 100,
  \ 'z': 60,
\ }
" }}}

" Configurations
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

let g:indentLine_char = '¦'
let g:indentLine_color_term = 239

set ignorecase
set cursorline
set colorcolumn=80
set ruler

"" Active Buffers
set hidden

"" Show Lines
set number

"" Show Relative Lines
set relativenumber

"" Preview Substitute
set inccommand=split

"" Leader Key
let mapleader = ","

"" Nerdtree
nnoremap <leader>1 :NERDTreeToggle<cr>
let g:NERDTreeHijackNetrw = 0
let NERDTreeMapActivateNode='<space>'

"" Fzf
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

"" Snippets
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight ALEWarning ctermbg=DarkMagenta

let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indentguides_ignorelist = ['text', 'markdown']

" Fix tmux navigation
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Navigate splits
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j

" ##### Fugitive  {{{
" (thanks to Steve Losh's vimrc)
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gm :Gmove
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gp :Git push
" }}}

" Save
nnoremap <c-s> :w<cr>
"" Custom Commands
" comma dangle
nnoremap <leader>cd A,<esc>
" exit insert mode
imap jj <esc>
" vertical split
nnoremap <leader>vs :vsplit<CR>

nnoremap <C-w> :Buffers<CR>
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gd :bd<CR>

" ##### Line movement {{{
" Go to start of line with H and to the end with $
noremap H ^
noremap L $

" Emacs bindings in command-line mode
cnoremap <C-A> <home>
cnoremap <C-E> <end>
" }}}

" ##### Folding {{{
" Toggles folding with space
nnoremap <Space> za
" Open all folds
nnoremap zO zR
" Close all folds
nnoremap zC zM
" Close current fold
nnoremap zc zc
" Close all folds except the current one
nnoremap zf mzzMzvzz
" }}}

" Resize Panels with Shift
nnoremap <Down> <c-w>+
nnoremap <Up> <c-w>-
nnoremap <Left> <c-w><
nnoremap <Right> <c-w>>

"" Open and Reload init.vim
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>


filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" But not for py files...
autocmd FileType *.py set shiftwidth=4
autocmd FileType *.py set tabstop=4
"
