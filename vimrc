call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'fannheyward/coc-rust-analyzer'
Plug 'unblevable/quick-scope'
Plug 'cocopon/iceberg.vim'
Plug 'ap/vim-css-color'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ron-rs/ron.vim'
call plug#end()

filetype plugin indent on

let g:rustfmt_autosave = 1  " format rust code on save

" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"set termguicolors
set background=dark
colorscheme iceberg

set nocompatible
set autoindent
set smartindent
set shiftwidth=3
set nobackup  "no ~ file
set relativenumber    "relative line numbers
set number            " this will give the current line the 'real' number
set expandtab "no tabs, use spaces
set tabstop=3
set ignorecase "case insensitive search
set smartcase
set hlsearch   "highlight search
set incsearch
set showmatch  "matching brackets
set mat=2      " tenth of second to blink cursor
set showtabline=2 " always show tabs
"set formatoptions-=cro   "Stop newline continution of comments
autocmd FileType * set formatoptions-=cro   "the line above is not honored for some reason...
set autochdir

"no sounds on error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set noswapfile
set nowb
set cursorline
syntax on

"set guifont=Lucida_Sans_Typewriter:h12
"hi CursorLine guibg=Grey40

if has("gui_running")
  set autochdir
  " the color of the line numbers
  "highlight LineNr guifg=#569EC0
  "don't show toolbar
  set guioptions-=T

  "highlighted text copied into windows buffer
  set guioptions+=a

  "the color of the highlighted line
  "highlight CursorLine guibg=#383838
  "colorscheme torte
endif


""NERDTree stuff
""Ctrl-n to toggle NERDTree
"map <C-n> :NERDTreeToggle<CR>
""Where's File (wf) shows the file in NERDTree
"nnoremap <F9> :NERDTreeFind<CR>

"tab stuff
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<Space>
nnoremap to :tabonl<Space>
"telescope key bindings
nnoremap ff :Telescope find_files<CR>
nnoremap lg :Telescope live_grep<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if &diff
    highlight! link DiffText MatchParen
endif
