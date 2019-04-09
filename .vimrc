" ------ Vim Tips ------
"
" Using surrond:
" 	ys - standard
" 	e.g. ysiw"    puts " around word
" 	e.g. yss}     puts } around the line
"	e.g. ds{	  deletes the surrondings
" :set syntax=sh
"
" Words currently highlighted (see hi): NEXT IMPORTANT NOTE
"
" Use Ctrl+V to go into block visual, then Select the lines you want then press dd to delete comments or...
" SHIFT+i to insert in block type the comment chars and then ESC and wait...!
"
" ALSO in functions use dots like php to do string insertion
"
" Use ma to make a marker called a at line
" Use `a to jump to a 
" Use dma to delete marker
"
" Use zf to fold with args e.g. zf3j folds and next 3 lines
" Use zd to delete a fold
" 
" use this to read in bash things
" :read !ls
" 
" Also use V to select full line
" Use I to insert at the start
" Use A to append at the end
"
" When all selected then type
" :norm Iblahblah
" runs a command from norm on all lines
"
" ----------------------
set nocompatible
syntax on
set relativenumber
set number
set splitbelow splitright
"set autoindent
"set smartindent
filetype plugin indent on
set shiftwidth=4
set complete-=i
set showcmd
set showmatch
set incsearch
set tabstop=4
set hlsearch
set foldmethod=indent
set foldlevelstart=20
set modifiable
set ignorecase
set linebreak
set scrolloff=3
"set list
" ABOVE enables the viewing of line breaks and indents


set nostartofline
"set cmdheight=2
" ABOVE is used to make the command bar bigger
set backspace=indent,eol,start
nnoremap £ i#
inoremap £ #

let mapleader = "-"
let maplocalleader = "-"

" +++++ Plugins using plug.vim - Plugin Manager +++++
call plug#begin('~/.vim/plugged')
"https://github.com/w0rp/ale.git
Plug 'w0rp/ale'
"https://github.com/vim-airline/vim-airline.git
Plug 'vim-airline/vim-airline'
"https://github.com/kshenoy/vim-signature.git
Plug 'kshenoy/vim-signature'
"https://github.com/junegunn/fzf.git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"https://github.com/junegunn/fzf.vim.git
Plug 'junegunn/fzf.vim'
"https://github.com/scrooloose/nerdtree.git
Plug 'scrooloose/nerdtree'
"https://github.com/valloric/youcompleteme.git
Plug 'valloric/youcompleteme'
"https://github.com/udalov/kotlin-vim.git
Plug 'udalov/kotlin-vim'
"https://github.com/ap/vim-css-color.git
Plug 'ap/vim-css-color'
"https://github.com/dracula/vim.git
Plug 'dracula/vim'
"https://github.com/severin-lemaignan/vim-minimap.git
Plug 'severin-lemaignan/vim-minimap'
"https://github.com/tpope/vim-surround,git
Plug 'tpope/vim-surround'
"https://github.com/tpope/vim-commentary.git
Plug 'tpope/vim-commentary' 
"https://github.com/idanarye/vim-vebugger.git
"Plug 'idanarye/vim-vebugger'
"https://github.com/jvenant/vim-java-imports.git
"Plug 'jvenant/vim-java-imports'
"https://github.com/akhaku/vim-java-unused-imports.git
"Plug 'akhaku/vim-java-unused-imports'
call plug#end()

" Call :PlugInstall to install plugins
" Call :PlugClean to delete removed/commented out plugins
" +++++++++++++++++++++++++++++++++++++++++++++++++++
"
" FOR YOUCOMPLETEME
let g:ycm_min_num_of_chars_for_completion = 1

color dracula
"Starting with cursor line off but -i toggles it on and off
"set cursorline
:hi CursorLine ctermbg=darkblue ctermfg=white
nnoremap <leader>i :set cursorline!<CR>
" FOR NERDTREE
let g:NERDTreeMapActivateNode='l'
let NERDTreeShowHidden=1
"nnoremap r :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeToggle<CR>
noremap <C-o> :NERDTreeToggle<CR>
"Below locates the current file in the dir
nnoremap <silent> <leader>v :NERDTreeFind<CR>

" FOR vim-minimap
let g:minimap_toggle='<leader>m'

" FOR FZF Use ; :Files then ctrl-x
noremap ; :Sexyfzf<CR>
"noremap ; :Files<CR>
noremap <leader>; :GFiles<CR>
let g:fzf_action = {
			\ 'enter': 'split',
			\ 'ctrl-t': 'tab split',
			\ 'space': 'tab split' }

let g:fzf_buffers_jump=1

command! -bang -nargs=* Sexyfzf
  \ call fzf#vim#files(<q-args>,fzf#vim#with_preview('right:50%'))

"command! -bang -nargs=* Sexyfzf
"  \ call fzf#vim#files(<q-args>,
"  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \                 <bang>0)
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

map <F7> mzgg=G`z
" NOTE: Below is to enable lightline properly and airline(popular)
set laststatus=2
set noshowmode
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" PLUGIN indent_guides
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level=1
"let g:indent_guides_auto_colors = 0

hi Search term=standout guibg=red guifg=red ctermbg=Magenta ctermfg=white
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=DarkGray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=Gray
hi TODO term=standout guifg=blue guibg=white ctermbg=blue ctermfg=white
call matchadd('TODO','TODO')
hi NOTE term=standout guifg=blue guibg=white ctermbg=white ctermfg=blue
call matchadd('NOTE','NOTE')
hi NEXT term=standout guifg=red guibg=green ctermbg=blue ctermfg=red
call matchadd('NEXT', 'NEXT')
hi IMPORTANT term=bold ctermbg=red ctermfg=white
call matchadd('IMPORTANT', 'IMPORTANT')

" ===== FUNCTIONS =====

function EnterHTMLMode()
	:nnoremap bo i<b><cr><c-t><esc>
	:nnoremap bc i<cr><c-d></b><esc>
endfunction

function ExitHTMLMode()
	:nunmap bo
	:nunmap bc
endfunction

function Present()
	set foldlevelstart=2
endfunction

function Keys()
	echom "===== Bens Keys ====="
	echom "za - toggle fold , zR - open all folds , zM - close all folds"
	echom "r - open NERDTree , ; - for fzf Files , -; - for fzf GFiles"
	echom "ma - mark at a , 'a go to a , dma delete mark at a"
	let ok = input("Ok?")
	set cmdheight=1
endfunction

nnoremap <leader>h :call Keys()<CR>

":call Yo()
:function Yo()
:	echom "LOG"
:endfunction

:function Html()
:	0r ~/.vim/temps/html.html
:endfunction

:function Welcome(name)
:	echom "hello: ".a:name . "tes"
:	echom a:name
:endfunction

:function CloseAllSections()
:	:normal zM
:endfunction


"a: tells vim this in in the arguement scope
":function Comment(from,to)
":	echom a:from
":	echom a:to
":	a:from,a:to/^/#
":endfunction
" Instead use CTRL+V, SHIFT+I enter char and then ESC
"
" =====================

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap <leader>h :vertical resize -5<CR> 
nnoremap <leader>j :resize -5<CR>
nnoremap <leader>k :resize +5<CR> 
nnoremap <leader>l :vertical resize +5<CR> 

nnoremap < V<
nnoremap > V>

nnoremap n nzz

inoremap {<CR> {<Esc>o}<Esc>O
"inoremap <leader><Space> <Esc>/<++><Enter>"_c4l
"autocmd FileType html inoremap ;p <p></p><Space><++><Esc>FpT>i

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap / /\v
vnoremap / /\v

nnoremap <leader>x :bd<CR>
nnoremap aa ggVG
nnoremap <leader>a ggVG

nnoremap <space> za

"nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Left> :tabp<CR>
"nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Right> :tabn<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
:command Q q
:command WQ wq
:command Wq wq
nnoremap Y 0y$
:cmap Q! q!

:nnoremap rw cw<C-r>0<ESC>

"MAC Command Key
"These dont work in MAC VIM CLI at all have to be specially set, not portable
"nnoremap <D-/> gcc
"vnoremap <D-/> gc

command! -bang -nargs=* Todo
  \ call Todos() 


function Todos()
	echom "Todos:"
endfunction

"au VimEnter * echo 'za - toggle fold , zR - open all folds , zM - close all
"folds , r - open NERDTree , ; - for fzf Files , -; - for fzf GFiles'

:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
au BufNewFile,BufRead Jenkinsfile setf groovy

set clipboard=unnamed
:vnoremap <leader>c y<esc>Go<esc>p:.!pbcopy<cr> 
":vnoremap <C-c> :w !pbcopy<CR><CR> 
":noremap <C-v> :r !pbpaste<CR><CR>
:vnoremap <leader>d :echo "tsststr"
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jj <esc>


nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh 0r ~/.vim/temps/skel.sh
		autocmd BufNewFile *.java 0r ~/.vim/temps/skel.java
		autocmd BufNewFile *.cpp 0r ~/.vim/temps/skel.cpp
	augroup END
endif

