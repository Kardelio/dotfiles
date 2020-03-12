" ------ Vim Tips ------
" :tabonly
"   only but for tabs
" :tabnew
"   new tab empty
"
" :%s/pattern//gn
" Find how many times a search pattern exists in file
"
" Below is how to profile in vim to see what is being slow
" :profile start profile.log
" :profile func *
" :profile file *
" "At this point do slow actions
" :profile pause
" :noautocmd qall!
"
" Very useful link for creating vim plugins:
" https://gist.github.com/nelstrom/1056049/784e252c3de653e204e9e128653010e19fbd493f
" Guide to making vim plugins
" https://blog.semanticart.com/2017/01/05/lets-write-a-basic-vim-plugin/
"
":redir @a
":function
":redir END
" paste register a 
"
" :g/PATTERN/d
" 	- deletes lines with pattern in it
"
" %!grep app
" %!echo 'dfasd'
" 	- perform the command on the current file as stdin
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
" % to find bracket pair
" will jump to the pair of the bracket
"
" :set wrap!
" 	- toggle line wrap
"
" za - toggle fold , zR - open all folds , zM - close all folds
"    Vim folding commands
" ---------------------------------
" zf#j creates a fold from the cursor down # lines.
" zf/ string creates a fold from the cursor to string .
" zj moves the cursor to the next fold.
" zk moves the cursor to the previous fold.
" za toggle a fold at the cursor.
" zo opens a fold at the cursor.
" zO opens all folds at the cursor.
" zc closes a fold under cursor. 
" zm increases the foldlevel by one.
" zM closes all open folds.
" zr decreases the foldlevel by one.
" zR decreases the foldlevel to zero -- all folds will be open.
" zd deletes the fold at the cursor.
" zE deletes all folds.
" [z move to start of open fold.
" ]z move to end of open fold.
"
" CTAGS:
" https://andrew.stwrt.ca/posts/vim-ctags/
" ----------------------
set nocompatible
syntax on
set relativenumber
set number
set splitbelow splitright
set backupdir=~/swpfiles
set directory=~/swpfiles
"set spell spelllang=en_gb
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
"
set foldmethod=syntax
"syntax, indent
set foldlevelstart=20
"
set modifiable
set ignorecase
set linebreak
set scrolloff=3
set list
set listchars=tab:>-,eol:$,space:·
set expandtab
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
"https://github.com/nicwest/vim-http.git
Plug 'nicwest/vim-http'
"TODO
Plug 'gabrielelana/vim-markdown'
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
"noremap <C-o> :NERDTreeToggle<CR>
"Below locates the current file in the dir
"nnoremap <silent> <leader>v :NERDTreeFind<CR>

" FOR vim-minimap
let g:minimap_toggle='<leader>m'

function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction

command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

let g:fzf_action = {
			\ 'enter': 'split',
			\ 'ctrl-t': 'tab split',
			\ 'space': 'GotoOrOpen tab' }
			"\ 'space': 'tab split' }
let g:fzf_buffers_jump=1

"sets the AG quickfix K window to open in new tab instead
:set switchbuf+=newtab

command! -bang -nargs=* BasicFzf
  \ call fzf#run(fzf#vim#with_preview({'source': 'find . -not -path "*/\.*" -type f', 'right': '50%', 'window': '30split'})) 

command! -bang -nargs=* FullFzf
  \ call fzf#vim#files(<q-args>,fzf#vim#with_preview('right:50%'))

noremap ; :FullFzf<CR>
"noremap ' :BasicFzf<CR>
noremap <leader>; :GFiles<CR>
"
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
let g:airline_section_y = airline#section#create(['%b %B'])

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
	echom "z= - spell fix, ]s and [s move between mistake, zg mark spell as ok"
	let ok = input("Ok?")
	set cmdheight=1
endfunction

"nnoremap <leader>e :call Keys()<CR>
nnoremap <leader>s :call ToggleSpecialCharsVisibility()<CR>
nnoremap <leader>ss :call Shellcheck()<CR>

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

:function ToggleSpecialCharsVisibility()
:	:set list!
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

"gv = is start visual mode with same selection as before
vnoremap > >gv
vnoremap < <gv
"nnoremap < V<V
"nnoremap > V>V

nnoremap n nzz
nnoremap dd "dY"_dd
vnoremap d "dYgv"_d

"inoremap {<CR> {<Esc>o}<Esc>O
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
"nnoremap J :.!jq .<CR>:noh<CR>
nnoremap <leader>n :%s/\n//g<CR>
nnoremap <leader>d :%s/ //g<CR>

nnoremap <space> za

nnoremap o o<esc>
nnoremap O O<esc>

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

nnoremap <leader>v :call Vrc()<CR>
function Vrc()
	echom "Opening ~/.VIMRC"
	:sp $HOME/.vimrc
endfunction

function GetCurrentLine()
	let ln = line('.')
	echom "Current line is: "ln
	echom "Register a: "@a
	let ok = input("Ok?")
	set cmdheight=1
endfunction

command! -bang -nargs=* Todo
  \ call Todos() 

function Todos()
	echom "Todos:"
	:.!todo
endfunction

function Shellcheck()
	echom "Running Shellcheck *"
	:norm ggVGdd
	:.!shellcheck *
endfunction

"au VimEnter * echo 'za - toggle fold , zR - open all folds , zM - close all
"folds , r - open NERDTree , ; - for fzf Files , -; - for fzf GFiles'

:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
au BufNewFile,BufRead Jenkinsfile setf groovy
au BufNewFile,BufRead Fastfile setf ruby

set clipboard=unnamed
:vnoremap <leader>c y<esc>Go<esc>p:.!pbcopy<cr> 
":vnoremap <C-c> :w !pbcopy<CR><CR> 
":noremap <C-v> :r !pbpaste<CR><CR>
":vnoremap <leader>d :echo "tsststr"
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

inoremap jj <esc>


nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

if has("autocmd")
	augroup templates
		autocmd BufNewFile *.html 0r ~/.vim/temps/skel.html
		autocmd BufNewFile *.sh 0r ~/.vim/temps/skel.sh
		autocmd BufNewFile *.java 0r ~/.vim/temps/skel.java
		autocmd BufNewFile *.cpp 0r ~/.vim/temps/skel.cpp
	augroup END
endif

" My experimental plugin
set runtimepath+=/Users/ldev507/git/benvimplugin.vim
