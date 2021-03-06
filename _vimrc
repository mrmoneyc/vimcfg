"------------------------------------------------------------
"
" Vim configure file.
"
" Maintainer: Chun-Ping Chang (mrmoneyc) <moneyc.net -AT- gmail.com>
"
"------------------------------------------------------------
"------------------------------
" General abbreviates
"------------------------------
" Map abbr itoday to datetime e.g. 2010-06-24 04:20:00
iab itoday <C-r>=strftime("%Y-%m-%d %H:%M:%S")

"------------------------------
" dein
" NeoBundle alternative, to support more feature
"------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim
 let &runtimepath.=',~/.vim/bundle/ale'
endif

if dein#load_state(expand('$HOME/.vim/bundle'))
  " Required:
  call dein#begin(expand('$HOME/.vim/bundle'))

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  "------------------------------
  " Add or remove your plugins here
  "------------------------------
  " Colorscheme
  call dein#add('vim-scripts/ScrollColors')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('chriskempson/base16-vim')
  call dein#add('goatslacker/mango.vim')
  call dein#add('marcus/vim-mustang')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('jonathanfilip/vim-lucius')
  call dein#add('noahfrederick/vim-hemisu')
  call dein#add('dracula/vim')
  call dein#add('sonph/onehalf', {'rtp': 'vim/'})
  call dein#add('google/vim-colorscheme-primary')
  call dein#add('hauleth/blame.vim')
  call dein#add('beigebrucewayne/Turtles')
  call dein#add('hzchirs/vim-material')
  call dein#add('exitface/synthwave.vim')
  call dein#add('tomasiser/vim-code-dark')

  " UI
  call dein#add('Shougo/vimshell.vim')
  " You can specify revision/branch/tag.
  " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('Shougo/unite.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('maximbaz/lightline-ale')
  call dein#add('sjl/gundo.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('mhinz/vim-startify')
  call dein#add('majutsushi/tagbar')
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('lilydjwg/colorizer')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('wsdjeg/dein-ui.vim')

  " File management
  call dein#add('joonty/vim-sauce.git')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('yegappan/mru')
  call dein#add('vim-scripts/sudo.vim')

  " Editing
  call dein#add('mattn/emmet-vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('benjifisher/matchit.zip')
  call dein#add('mileszs/ack.vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('editorconfig/editorconfig-vim')
  " call dein#add('scrooloose/vim-slumlord')

  " Auto completion
  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  " call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/neco-vim')

  " Index
  call dein#add('universal-ctags/ctags')
  call dein#add('craigemery/vim-autotag')

  " Syntax
  call dein#add('StanAngeloff/php.vim')
  call dein#add('posva/vim-vue')
  call dein#add('google/vim-jsonnet')
  call dein#add('kylef/apiblueprint.vim')
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('ain/vim-capistrano')
  call dein#add('rodjek/vim-puppet')
  call dein#add('martinda/Jenkinsfile-vim-syntax')
  call dein#add('ekalinin/Dockerfile.vim')
  call dein#add('liuchengxu/graphviz.vim')
  " call dein#add('aklt/plantuml-syntax')

  " Linter
  call dein#add('w0rp/ale')

  " Language Server
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')

  " For Golang Development
  call dein#add('fatih/vim-go')
  " call dein#add('mdempsky/gocode', {'rtp': 'vim/'})
  " call dein#add('sebdah/vim-delve')

  " For Rust Development
  call dein#add('rust-lang/rust.vim')

  " For PHP Development
  call dein#add('shawncplus/phpcomplete.vim')
  " call dein#add('mkusher/padawan.vim')

  " For Python Development
  call dein#add('plytophogy/vim-virtualenv')
  call dein#add('davidhalter/jedi-vim')

  " For JavaScript Development
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  " For C/C++ Development
  call dein#add('vim-scripts/OmniCppComplete')
  call dein#add('justmao945/vim-clang')

  " For Ruby Development
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('ruby-formatter/rufo-vim')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-cucumber')
  call dein#add('skalnik/vim-vroom')

  " For HashiCorp tool
  call dein#add('hashivim/vim-terraform')
  call dein#add('juliosueiras/vim-terraform-completion')
  call dein#add('hashivim/vim-vagrant')

  " Utilities
  call dein#add('vimwiki/vimwiki')
  call dein#add('vim-scripts/calendar.vim')
  call dein#add('joonty/vdebug')
  call dein#add('mattn/webapi-vim')
  call dein#add('christoomey/vim-quicklink')
  call dein#add('skywind3000/asyncrun.vim')
  call dein#add('tpope/vim-dispatch')
  call dein#add('wesleyche/SrcExpl')

  " External Utilities
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('rizzatti/funcoo.vim')
  call dein#add('rizzatti/dash.vim')
  call dein#add('rafaelfranca/rtf_pygmentize')

  " Misc
  " call dein#add('mattn/vim-particle')
  "------------------------------
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Clean disable plugins
call map(dein#check_clean(), "delete(v:val, 'rf')")

"------------------------------
" General
"------------------------------
let changelog_username = 'Chun-Ping Chang (mrmoneyc) <moneyc.net -AT- gmail.com>'

" Pick up the local .vimrc file
set exrc

" All custom macros start with ,
let maplocalleader=','

" Enable syntax hightlight
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" Show briefly matching bracket when closing it.
set showmatch

" Disable sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" Don't make backups
set nobackup

" Modelines is 3 hight
"set modelines 3

" Set swap file directory, you can place this directory to ramdisk and link it
set dir=$HOME/.vim/vimswap

" Always read last position.
au BufReadPost * if line("'\"") > 0|if line("'\"")
\ <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Remove trailing whitespace when writing a buffer, but not for diff files. From: Vigil
fun! RemoveTrailingWhitespace()
  if &ft != 'diff'
    let b:curcol = col('.')
    let b:curline = line('.')
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
  endif
endfun
au BufWritePre * call RemoveTrailingWhitespace()

" Display underline on the line under cursor
set cursorline

" Display vertical line with cursor
"set cursorcolumn

" Display underline in NORMAL mode, hide in INSERT mode
au InsertEnter * set nocul
au InsertLeave * set cul

" Minimal number of lines to scroll when the cursor gets off the screen (default: 1)
set scrolljump=1

"Minimal number of screen lines to keep above and below the cursor (default: 0)
set scrolloff=3

"Incremental search
set incsearch

" Key binding: Ctrl+Z - use shell, type exit return to Vim
map <C-Z> :shell<CR>

" Key binding: ; - Fast switch command mode, use ; insted :
nnoremap ; :

" Key binding: ,reload - reload .vimrc
nmap <localleader>reload :source $HOME/.vimrc<CR>

" Specify different platform path
if has('mac') || has('gui_mac')
 let $PATH = $PATH . ':' . expand('/opt/local/bin') . ':' . expand('~/.composer/vendor')
endif

" Make a buffer modifiable
" set modifiable

" Open split window below/right side
set splitbelow
set splitright

"------------------------------
" Edit setting
"------------------------------
" Make backspace work like most other apps
set backspace=2
set backspace=indent,eol,start

" Tab shift width
set expandtab
set smarttab
set shiftwidth=2

" Key binding: ,t2 - Set shift width = 2
nmap <localleader>t2 :set shiftwidth=2<CR>

" Key binding: ,t4 - Set shift width = 4
nmap <localleader>t4 :set shiftwidth=4<CR>

" Filetype setting
filetype on
filetype plugin on
filetype indent on

" Auto set shift width by filetype
au FileType perl,vim,html,javascript,css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2
au FileType c,cpp,php,java,sh,apiblueprint
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4
au FileType python
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix
au FileType go
  \ set tabstop=8 |
  \ set softtabstop=8 |
  \ set shiftwidth=8

" Word wrap without line breaks
set wrap
set linebreak
"set textwidth=500
"set textwidth=90
"set cc=+1
"set cc=+1,+2,+3,+4,+5,+6
"set wrapmargin=0
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929 guifg=white
"match OverLength /\%90v.\+/

" Smart indent when entering insert mode with i on empty lines
fun! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Key binding: ,m - Remove the Windows ^M char
noremap <localleader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Super paste
inoremap <C-v> <ESC>:set paste<CR>mui<C-R>+<ESC>mv'uV'v=:set nopaste<CR>

" Delete a name of a php variable without dollar sign
" http://stackoverflow.com/questions/32928881/vim-syntax-delete-a-name-of-a-php-variable-without-dollar-sign
augroup PHP
  autocmd!
  autocmd FileType php setlocal iskeyword-=$
augroup END

" PHP Syntax Override
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Fast modify in equation like (a=b)
" Key binding: cr= - modify right statment
" Key binding: cl= - modify left statment
if &ft == 'python'
  nmap cr= $F=lc$
else
  nmap cr= $F=lcf;
endif
nmap cl= $F=hc^

" Enable inserts links & anchors on a TOhtml export automatic.
" Notice:
" Syntax used is:
" Link
" Anchor
fun! SmartTOHtml()
  TOhtml
  try
    %s/&quot;\s\+\*&gt; \(.\+\)</' <a href='#\1' style='color: cyan'>\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</' \&nbsp;\&nbsp; <a href='#\2' style='color: cyan;'>\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</' <a name='\1' style='color: #fff'>\1<\/a></g
  catch
  endtry
  exe ':write!'
  exe ':bd'
endfun

" Save as Root
cnoremap w!! w !sudo tee % >/dev/null

" enable all Python syntax highlighting features
let python_highlight_all = 1

"------------------------------
" Indent setting
"------------------------------
" Auto indent
set ai

" Smart indent
set si

" C-style indent
set cindent

"------------------------------
"  Using [TAB] and [SHIFT-TAB] to indent on Normal mode
"------------------------------
nmap <TAB> V>
nmap <S-TAB> V<
xmap <TAB> >gv
xmap <S-TAB> <gv

"------------------------------
" Folding
"------------------------------
" Folding method (syntax/marker/indent)
set foldmethod=marker

" Display folding status
set foldcolumn=1

" Max folding
set foldnestmax=3

"------------------------------
" File encoding
"------------------------------
" Set suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Set EOL formats
set fileformats=unix,mac,dos

" Default encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,big5,sjis,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" Key binding: ,big5 - Convert file encoding to big5
nmap <localleader>big5 :set fileencoding=big5<CR>

" Key binding: ,utf8 - Convert file encoding to utf8
nmap <localleader>utf8 :set fileencoding=utf8<CR>

" Key binding: ,fd - Convert current file to dos format
nmap <localleader>fd :set ff=dos<CR>

" Key binding: ,fu - Convert current file to unix format
nmap <localleader>fu :set ff=unix<CR>

"------------------------------
" Window move cursor key binding
"------------------------------
" Smart way to move between windows
" Key binding: Ctrl+j - move to bottom window
map <C-j> <C-W>j
" Key binding: Ctrl+k - move to up window
map <C-k> <C-W>k
" Key binding: Ctrl+h - move to right window
map <C-h> <C-W>h
" Key binding: Ctrl+l - move to left window
map <C-l> <C-W>l

"------------------------------
" Tabs key binding
"------------------------------
augroup Tabs
" Key binding: ,tc - New tab
  nmap <localleader>tc :tabnew<CR>
" Key binding: ,te - Open new tab and edit
  nmap <localleader>te :tabedit<SPACE>
" Key binding: ,tx - New tab and browser
  nmap <localleader>tx :tabedit .<CR>
" Key binding: ,tf - Jump to first tab
  nmap <localleader>tf :tabfirst<CR>
" Key binding: ,tl - Jump to last tab
  nmap <localleader>tl :tablast<CR>
" Key binding: ,tn - Jump to next tab
  nmap <localleader>tn :tabnext<CR>
" Key binding: ,tp - Jump to previous tab
  nmap <localleader>tp :tabprevious<CR>
" Key binding: ,tm - Move tab
  nmap <localleader>tm :tabmove<SPACE>
" Key binding: ,th - Open help in new tab
  nmap <localleader>th :tab help<CR>
augroup END

try
  set switchbuf=usetab
  set stal=2
catch
endtry

"------------------------------
" Search setting
"------------------------------
" From an idea by Michael Naumann
fun! VisualSearch(direction) range
  let l:saved_reg = @"
  execute 'normal! vgvy'
  let l:pattern = ESCape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, '\n$', '', '')
  if a:direction == 'b'
    execute 'normal ?' . l:pattern . '^M'
  else
    execute 'normal /' . l:pattern . '^M'
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfun

" Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"------------------------------
"  Diff
"------------------------------
" Style
if has('diff')
  hi DiffAdd ctermfg=Grey ctermbg=DarkBlue guifg=Grey
  hi DiffDelete ctermfg=Grey ctermbg=DarkRed guifg=Grey
  hi DiffChange ctermfg=Black ctermbg=DarkGreen guifg=Black
  hi DiffText ctermfg=White ctermbg=DarkRed guifg=Black
endif

"------------------------------
" String replace keybinding
"------------------------------
fun! MyReplace()
  call inputsave()
  let g:OriPattern = input("Pattern: ")
  let g:NewPattern = input("Replace '" . g:OriPattern . "' to: ")
  call inputrestore()
  if strlen(g:OriPattern) > 0
    if strlen(g:NewPattern) > 0
      exe '%s/' . g:OriPattern . '/' . g:NewPattern . '/g'
    endif
  endif
  echo "skipped."
endfun

nmap <localleader>h :call MyReplace()<CR>

"------------------------------
"  UI Style
"------------------------------
" Set color env
if !has('gui_running')
  set t_Co=256
endif

" Set background (dark/light)
set background=dark

" Display Vim mode
set showmode

" Turn on Wild menu
set wildmenu
set wildmode=list:longest,full

" Always show current position
set ruler

" Show line number
set nu

" Command bar height
set cmdheight=2

" Status bar
set laststatus=2

"------------------------------
" Function key binding (F1-F10)
"------------------------------
" Key binding: F2 - Toggle NERDTree
" nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeTabsToggle<CR>

" Key binding: F3 - Toggle Tagbar
nnoremap <F3> :TagbarToggle<CR>

" Key binding: F4 - Toggle SrcExpl
nmap <F4> :SrcExplToggle<CR>

" Key binding: F5 - key for toggle relative line number
nmap <F5> :set rnu!<BAR>set rnu?<CR>

" Key binding: F6 - Highlight trailing whitespace characters Vim Tip #1274
"set listchars=tab:->,trail:.
set listchars=tab:▸\ ,eol:¬
"set list
nmap <F6> :set list!<BAR>set list?<CR>

" Key binding: F7 - Create Ctag of current project.
nmap <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q .<CR>

" Key binding: Ctrl+F7 - Create Ctag of current folder.
nmap <C-F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+q -f '%:p:h\\tags' '%:p:h'<CR>

" Key binding: F8 - Highlight search things Enable/Disable
set hlsearch
nmap <F8> :set hls!<BAR>set hls?<CR>

" Key binding: ,, - Quick switch to normal mode
" noremap <LocalLeader>, <C-\><C-N>
" noremap! <LocalLeader>, <C-\><C-N>

"------------------------------
" External Application
"------------------------------
" Key binding: ,hex - View file in hex mode
nmap <localleader>hex :%!xxd<CR>

" Key binding: ,rhex - Return view file to normal mode from hex mode
nmap <localleader>rhex :%!xxd -r<CR>

"------------------------------
" Automatically fitting a quickfix window height
"------------------------------
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
	let l = 1
	let n_lines = 0
	let w_width = winwidth(0)
	while l <= line('$')
		" number to float for division
		let l_len = strlen(getline(l)) + 0.0
		let line_width = l_len/w_width
		let n_lines += float2nr(ceil(line_width))
		let l += 1
	endw
	exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"------------------------------------------------------------
" Plugins
"------------------------------------------------------------
"------------------------------
"  Status bar: lightline
"------------------------------
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'tagbar', 'virtualenv' ], ['ctrlpmark'] ],
  \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': {
  \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
  \   'virtualenv': '%{virtualenv#statusline()}',
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \   'ctrlpmark': 'CtrlPMark',
  \ },
  \ 'component_expand': {
	\  'linter_checking': 'lightline#ale#checking',
	\  'linter_warnings': 'lightline#ale#warnings',
	\  'linter_errors': 'lightline#ale#errors',
	\  'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
	\     'linter_checking': 'left',
	\     'linter_warnings': 'warning',
	\     'linter_errors': 'error',
	\     'linter_ok': 'left',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

fun! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

fun! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⨂' : ''
endfunction

fun! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

fun! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⚑ '._ : ''
  endif
  return ''
endfunction

fun! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

fun! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

fun! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

fun! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

fun! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

fun! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

fun! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
	let g:lightline.fname = a:fname
	return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

"------------------------------
" Indent Guides
"------------------------------
if has("gui_macvim")
  let g:indent_guides_enable_on_vim_startup = 1
end
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
"au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"------------------------------
"  Ctrl-P
"------------------------------
" Change the default mapping and the default command to invoke CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

" Working directory
" =================
" | 'c' - the directory of the current file.
" | 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" | 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" |  0 or '' (empty string) - disable this feature.
" =================
let g:ctrlp_working_path_mode = 'ra'

" Exclude files and directories
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  "\ }

" Use a custom file listing command
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" Disable caching
let g:ctrlp_use_caching = 1

"------------------------------
" Tagbar
"------------------------------
" Set ctags path (essential on Mac OS X)
if has("mac") || has("gui_mac")
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
  " sudo npm install -g git://github.com/ramitos/jsctags.git
  let g:tagbar_type_javascript = {'ctagsbin' : '/opt/local/bin/jsctags'}
else
  let g:tagbar_ctags_bin = '/usr/bin/ctags'
endif

" split to the right side of the screen
let g:tagbar_left = 0

" Tagbar window width
let g:tagbar_width = 35

" automatically close Tagbar when jump to a tag
let g:tagbar_autoclose = 0

" move the cursor to the Tagbar window when it is opened
let g:tagbar_autofocus = 1

" sort tag by name (set 0 sort by order)
let g:tagbar_sort = 0

" auto open closed fold when tag hilight
let g:tagbar_autoshowtag = 1

" remove extra information and blank lines from the taglist window.
let g:tagbar_compact = 1

let g:tagbar_foldlevel = 1
let g:tagbar_expand = 0

let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" The location of phpctags
let g:tagbar_phpctags_bin='$HOME/bin/phpctags'

" The amount of memory that phpctags can use
let g:tagbar_phpctags_memory_limit = '512M'

"------------------------------
" NERDTree
"------------------------------
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree and tabs together in Vim
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_synchronize_focus = 1
let g:nerdtree_tabs_focus_on_files = 0
let g:nerdtree_tabs_startup_cd = 1
let g:nerdtree_tabs_autofind = 0

"------------------------------
" Gundo
"------------------------------
nnoremap \u :GundoToggle<CR>
let g:gundo_width = 45
let g:gundo_preview_height = 15
let g:gundo_right = 0

"------------------------------
" VimShell
"------------------------------
let g:vimshell_editor_command = '/opt/local/bin/mvim --servername=VIM --remote-tab-wait-silent'
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"------------------------------
" MRU
"------------------------------
highlight link MRUFileName LineNr
" let MRU_File = '~/_vim_mru_files'
let MRU_Max_Entries = 1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
" let MRU_Exclude_Files = '^c:\\temp\\.*'           " For MS-Windows
let MRU_Window_Height = 10
let MRU_Use_Current_Window = 0
let MRU_Auto_Close = 1
let MRU_Add_Menu = 1
let MRU_Max_Menu_Entries = 20
let MRU_Max_Submenu_Entries = 15
let MRU_Filename_Format={'formatter':'v:val', 'parser':'.*'}

"------------------------------
"  Colorizer
"------------------------------
" Key binding: assign :ColorToggle to ,ct
let g:colorizer_nomap = 1
noremap <localleader>ct :ColorToggle<CR>

"------------------------------
" ScrollColor
"------------------------------
" Key binding: ,cn - Scroll next colorscheme
nmap <localleader>cn :NEXTCOLOR<CR>

" Key binding: ,cp - Scroll previous colorscheme
nmap <localleader>cp :PREVCOLOR<CR>

"------------------------------
" Nerd Commenter
"------------------------------
let NERDSpaceDelims = 1

"------------------------------
" ack.vim / ag.vim
"------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif"

let g:ackhighlight = 1
" let g:ackpreview = 0
" let g:ack_use_dispatch = 0

" Do not jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"------------------------------
"  Auto completion: neocomplete
"------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Always refresh
let g:neocomplete#enable_refresh_always = 1
" Fuzzy completion
let g:neocomplete#enable_fuzzy_completion = 0
" Auto Delimiter
let g:neocomplete#enable_auto_delimiter = 1
" Underbar Completion
let g:neocomplete#enable_underbar_completion = 1
" Camel Case Completion
let g:neocomplete#enable_camel_case_completion = 1


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.terraform = '[^ *\t"{=$]\w*'
" let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" let g:neocomplete#force_omni_input_patterns.php = '\h\w*::\|[^- \t]->\w*'
" let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#same_filetypes')
  let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.ruby = 'eruby'

let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
" autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
" autocmd Filetype ruby,eruby setlocal omnifunc=solargraph#CompleteSolar

set completeopt=longest,menuone

"------------------------------
"  Auto completion: neosnippet.vim
"------------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
" if has('conceal')
  " set conceallevel=2 concealcursor=niv
" endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='$HOME/.vim/bundle/vim-snippets/snippets'

"------------------------------
" Emmet
"------------------------------
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

"------------------------------
" vim-sauce
"------------------------------
let g:sauce_path = "$HOME/.vim/vimsauce"

"------------------------------
" Vdebug
"------------------------------
let g:vdebug_keymap = {
\    "run" : "<Leader>/",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>p",
\    "eval_visual" : "<Leader>e"
\}

let g:vdebug_options = {
\    "break_on_open" : 0,
\}

"------------------------------
" ALE
"------------------------------
" Key Mappings
nnoremap <silent> <leader>sc :ALELint<cr>
nnoremap <silent> <leader>sn :ALENext<cr>
nnoremap <silent> <leader>sN :ALEPrevious<cr>
nnoremap <silent> <leader>sp :ALEPrevious<cr>
nnoremap <silent> <leader>sr :ALEDisable<cr>
nnoremap <silent> <leader>st :ALEToggle<cr>
nnoremap <silent> <leader>si :ALEInfo<cr>

" Set 1 to keep the sign gutter open
let g:ale_sign_column_always = 0

" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" 'always' or 'normal' / 'never'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" If you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0

let g:ale_linters = {
\   'go': ['gopls'],
\   'php': ['php -l', 'phpcs'],
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

" PHP
let g:ale_php_phpcs_standard = '$HOME/dotenv/Vim/phpcs.xml'

" Go
" let g:ale_go_langserver_executable = 'gopls'

"------------------------------
" vim-go
"------------------------------
" Key Mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Opens the target identifier in current buffer
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Show a list of interfaces which is implemented by the type under cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" Enable code completion
let g:go_code_completion_enabled = 1

" Disable opening browser after posting to your snippet to play.golang.org
let g:go_play_open_browser = 0

" By default vim-go shows errors for the fmt command, to disable it
let g:go_fmt_fail_silently = 1

" Enable goimports to automatically insert import paths instead of gofmt
" let g:go_fmt_command = "gofmt"
let g:go_fmt_command = "goimports"

" Auto fmt on save
let g:go_fmt_autosave = 1

" By default binaries are installed to $GOBIN or $GOPATH/bin. To change it
"let g:go_bin_path = expand("~/.gotools")
"let g:go_bin_path = "/home/fatih/.mypath"      "or give absolute path

" By default syntax-highlighting for Functions, Methods and Structs is
" disabled. To change it
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" let g:go_list_type = "quickfix"

let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

" Support Go Language Server Protocol
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"

"------------------------------
" phpcomplete-extended
"------------------------------
" let g:phpcomplete_index_composer_command = "$HOME/bin/composer"

"------------------------------
" Padawan.vim
"------------------------------
let g:padawan#composer_command = "$HOME/bin/composer"

" http request timeout
let g:padawan#timeout = 0.1

" If padawan not install global
" let g:padawan#cli = '/path/to/padawan.php/bin/padawan'
" let g:padawan#server_command = '/path/to/padawan.php/bin/padawan-server'

"------------------------------
" vim-jsx
"------------------------------
" Allow JSX in normal JS files
let g:jsx_ext_required = 0

"------------------------------
" Vimwiki
"------------------------------
let g:vimwiki_use_mouse = 1

let wiki = {}
let wiki.path = '$HOME/vimwiki/'
let wiki.path_html = '$HOME/vimwiki/html/'
let wiki.template_path = '$HOME/vimwiki/templates/'
let wiki.template_default = 'default'
let wiki.template_ext = '.tpl'
let wiki.auto_export = 1
let wiki.auto_toc = 1
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

noremap \h :VimwikiAll2HTML<CR>

"------------------------------
" RTF Pygmentize
"------------------------------
" Valid options are: 'default', 'emacs', 'friendly' and 'colorful'
let g:rtfp_theme = 'emacs'
let g:rtfp_font = 'Menlo'

"Key binding: CMD+c - Copy colored source code to clipboard
" smap <D-c> :RTFPygmentize<CR>

"------------------------------
" vim-markdown
"------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

"------------------------------
" vim-virtualenv
"------------------------------
let g:virtualenv_directory = '$HOME/.pyenvs'
let g:virtualenv_stl_format = '[%n]'
" let g:virtualenv_auto_activate = 1

"------------------------------
" Append virtualenv site_packages to sys.path
"------------------------------
if has('python3')
py3 << EOF
import os, sys, pathlib
if 'VIRTUAL_ENV' in os.environ:
  venv = os.getenv('VIRTUAL_ENV')
  site_packages = next(pathlib.Path(venv, 'lib').glob('python*/site-packages'), None)
  if site_packages:
    sys.path.insert(0, str(site_packages))
EOF
elseif has('python')
py << EOF
import os, os.path, sys, vim

if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
  python_version = os.listdir(project_base_dir + '/lib')[0]

  site_packages = os.path.join(project_base_dir, 'lib', python_version, 'site-packages')
  current_directory = os.getcwd()

  sys.path.insert(1, site_packages)
  sys.path.insert(1, current_directory)
EOF
endif

"------------------------------
" SrcExpl
"------------------------------
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
" let g:SrcExpl_updateTagsKey = "<F12>"

"------------------------------
" rufo-vim
"------------------------------
let g:rufo_auto_formatting = 0

"------------------------------
" vim-lsp
"------------------------------
let g:lsp_diagnostics_enabled = 0 " disable document diagnostics
let g:lsp_signs_enabled = 0         " disable signs
let g:lsp_diagnostics_echo_cursor = 0 " disable echo under cursor when in normal mode

let g:lsp_signs_error = {'text': '●'}
let g:lsp_signs_warning = {'text': '.'}
" let g:lsp_signs_error = {'text': '✗'}
" let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'} " icons require GUI
" let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

" let g:lsp_log_verbose = 0
" let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" if executable('gopls')
  " " go get -u golang.org/x/tools/cmd/gopls
  " augroup lsp_go
    " au!
    " au User lsp_setup call lsp#register_server({
          " \ 'name': 'gopls',
          " \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
          " \ 'whitelist': ['go'],
          " \ })
    " au FileType go setlocal omnifunc=lsp#complete
    " au BufWritePre *.go LspDocumentFormatSync
    " "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
    " "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
    " "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
    " au FileType go nmap <Leader>d <Plug>(lsp-definition)
  " augroup END
" endif

if executable('solargraph')
  " gem install solargraph
  augroup lsp_solargraph
    au!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'solargraph',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
          \ 'initialization_options': {"diagnostics": "false"},
          \ 'whitelist': ['ruby', 'eruby'],
          \ })
    au FileType ruby,eruby setlocal omnifunc=lsp#complete
  augroup end
endif

if executable('rls')
  " gem install solargraph
  augroup lsp_rls
    au!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'rls',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rls']},
          \ 'initialization_options': {"diagnostics": "false"},
          \ 'whitelist': ['rust'],
          \ })
    au FileType rust setlocal omnifunc=lsp#complete
  augroup end
endif

"------------------------------
" PlantUML
"------------------------------
let g:plantuml_executable_script = '/opt/local/bin/plantuml'

"------------------------------------------------------------
