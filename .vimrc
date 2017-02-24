" Vundle necessary settings
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ctrlp
let g:ctrlp_map = '<c-p>'

syntax on

"colorscheme murphy
colorscheme delek
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
"set backup             " Keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file -- limit to only 50
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set ts=2                " 2 space wide tabs
set sw=2
set softtabstop=2       "makes backspacing over spaced out tabs work real nice
set expandtab           "expand tabs to spaces
set ignorecase
set smartcase			"Only do a case sensitive search if the search term has an upper case
set background=dark     "awesome for terminals with crappy colors (putty!)
set tagstack            "lets you push and pop your jumps with ctrl+]
set pastetoggle=<F9>    "when you're pasting stuff this keeps it from getting
                        "all whacked out with indentation
set incsearch
set nohlsearch
set autoindent
set smartindent
set formatoptions=tcqor
set scrolloff=10
set wildmode=list:longest
set listchars=tab:>-,eol:$

" Indentiation for python files
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py inoremap # X<c-h>#<space>

nnoremap <Ins> <C-Y> 
nnoremap <Del> <C-E>

"dictionary word autocomplete. type <CTL-N> in the middle of a word to use
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k

" remove ^M characters from windows files
" WARNING: mapping to control-m also means that the enter key will map
"  to that action
"map <C-M> mvggVG:s/<C-V><CR>//g<CR>`v

"don't expand tabs if we're in a makefile
au BufRead,BufNewFile Makefile set ts=4 sw=4 noexpandtab

"good tab completion - press <tab> to autocomplete if there's a character
"previously
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"Following commands automatically match parens/brackets/braces
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

nnoremap <silent> <C-F> :execute 'grep! -Irni ' . expand("<cword>") . ' *' <CR>:cw<CR>

au BufReadPost quickfix nnoremap <CR> <C-W><CR>

"Automatically jump to the last line you were at (`" command does this)
autocmd BufReadPost *  exe "normal `\""

set noswapfile
