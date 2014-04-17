"------------------------------------------------------------
"
" Vim configure file.
"
" Maintainer: Chun-Ping Chang (mrmoneyc) <mmc -AT- mrmoneyc.org>
"
" Last modified: 2014-04-14 13:34:04
"
"------------------------------------------------------------

"------------------------------
" General abbreviates
"------------------------------
" Map abbr itoday to datetime e.g. 2010-06-24 04:20:00
iab itoday <C-r>=strftime("%Y-%m-%d %H:%M:%S")

" Map abbr imyinfo to your personal info. (need setting)
iab imyinfo Chun-Ping Chang (mrmoneyc) <mmc -AT- mrmoneyc.org>

"------------------------------
" NeoBundle
" Vundle alternative, to support non-git repos
"------------------------------
" required!

" Get out of VI's compatible mode.
set nocompatible

filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

if exists(':NeoBundle')
  " let NeoBundle manage NeoBundle
  " required!
  NeoBundle 'Shougo/neobundle.vim'
  " recommended to install
  " after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'

  " Install bundle list
  NeoBundle 'L9'

  " Install colorscheme
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'chriskempson/base16-vim'
  NeoBundle 'goatslacker/mango.vim'
  NeoBundle 'marcus/vim-mustang'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'jonathanfilip/vim-lucius'
  NeoBundle 'noahfrederick/vim-hemisu'

  " For JavaScript/Node.js development
  "NeoBundle 'hallettj/jslint.vim'
  NeoBundle 'walm/jshint.vim'
  " NeoBundle 'JiangMiao/simple-javascript-indenter'
  "NeoBundle 'othree/javascript-syntax.vim'
  "NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'jelera/vim-javascript-syntax'
  "NeoBundle 'jamescarr/snipmate-nodejs'
  "NeoBundle 'teramako/jscomplete-vim'
  NeoBundle 'mattn/jscomplete-vim'
  "NeoBundle 'myhere/vim-nodejs-complete'
  NeoBundle 'ahayman/vim-nodejs-complete'
  NeoBundle 'moll/vim-node'

  " For PHP development
  NeoBundle 'shawncplus/phpcomplete.vim'

  " For Golang development
  NeoBundle 'Blackrush/vim-gocode'

  " Auto complection and snipmate + snippets
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'MarcWeber/vim-addon-mw-utils'
  NeoBundle 'tomtom/tlib_vim'
  NeoBundle 'honza/vim-snippets'
  "NeoBundle 'msanders/snipmate.vim'
  NeoBundle 'garbas/vim-snipmate'


  NeoBundle 'lilydjwg/colorizer'
  "NeoBundle 'c9s/gsession.vim'
  " NeoBundle 'c9s/hypergit.vim'
  " NeoBundle 'c9s/simple-commenter.vim'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'Source-Explorer-srcexpl.vim'
  " NeoBundle 'tpope/vim-commentary'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'majutsushi/tagbar'
  "NeoBundle 'mattn/zencoding-vim'
  NeoBundle 'mattn/emmet-vim'
  "NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'plasticboy/vim-markdown'
  "NeoBundle 'Lokaltog/vim-easymotion'
  " NeoBundle 'mattn/gist-vim'
  NeoBundle 'rafaelfranca/rtf_pygmentize'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'spolu/dwm.vim'
  NeoBundle 'briancollins/vim-jst'

  NeoBundle 'DirDiff.vim'
  NeoBundle 'LargeFile'
  NeoBundle 'The-NERD-tree'
  NeoBundle 'ScrollColors'
  "NeoBundle 'bufexplorer.zip'
  NeoBundle 'cecutil'
  NeoBundle 'ctags.vim'
  "NeoBundle 'dbext.vim'
  NeoBundle 'FuzzyFinder'
  NeoBundle 'Gundo'
  NeoBundle 'matchit.zip'
  NeoBundle 'TaskList.vim'
  NeoBundle 'Align'
  NeoBundle 'IndentAnything'
  NeoBundle 'JSON.vim'
  NeoBundle 'jQuery'
  NeoBundle 'code2html'
  NeoBundle 'surround.vim'
  NeoBundle 'repeat.vim'
  NeoBundle 'sql.vim'
  NeoBundle 'nosql.vim'
  NeoBundle 'sudo.vim'
  NeoBundle 'ctrlp.vim'

  " Utilities
  NeoBundle 'vimwiki'
  NeoBundle 'calendar.vim'
  NeoBundle 'mileszs/ack.vim'

  " External Utilities
  NeoBundle 'rizzatti/funcoo.vim'
  NeoBundle 'rizzatti/dash.vim'

  " Installation check.
  "if neobundle#exists_not_installed_bundles()
    "echomsg 'Not installed bundles : ' .
          "\ string(neobundle#get_not_installed_bundle_names())
    "echomsg 'Please execute ":NeoBundleInstall" command.'
  "endif
endif


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

" Platform detect
if has('mac') || has('gui_mac')
"  let $PATH = '/opt/local/bin:'.$PATH
endif

"--------------------------------------------------
" fun! MyPlatform()
"   if has('unix')
"     let s:uname = system('uname')
"     if s:uname == 'Darwin'
"       return 'mac'
"     elseif s:uname == 'Linux'
"       return 'linux'
"     endif
"   else
"     return 'windows'
"   endif
" endfun
"--------------------------------------------------


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
au FileType html,python,perl,php,vim,javascript,css setl shiftwidth=2
au FileType html,python,perl,php,vim,javascript,css setl tabstop=2
au FileType html,python,perl,php,vim,javascript,css setl softtabstop=2
au FileType c,java setl shiftwidth=4
au FileType c,java setl tabstop=4
au FileType c,java setl softtabstop=4

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


"------------------------------
" Function key binding
"------------------------------
" Key binding: F2 - Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Key binding: F3 - Toggle Tagbar
nnoremap <F3> :TagbarToggle<CR>

" Key binding: F4 - Toggle SrxExpl
nmap <F4> :SrcExplToggle<CR>

" Key binding: F5 - key for toggle relative line number
nmap <F5> :set rnu!<BAR>set rnu?<CR>

" Highlight trailing whitespace characters Vim Tip #1274
"set listchars=tab:->,trail:.
set listchars=tab:▸\ ,eol:¬
"set list
"nmap <F5> :set list!<BAR>set list?<CR>
nnoremap <leader>L :set list!<CR>

" Key binding: F5 - key for updating the tags file artificially
" if has('mac') || has('gui_mac')
"   let g:SrcExpl_updateTagsCmd = '/opt/local/bin/ctags --sort=foldcase -R .'
" else
"   let g:SrcExpl_updateTagsCmd = '/usr/bin/ctags --sort=foldcase -R .'
" endif
" let g:SrcExpl_updateTagsKey = '<F5>'

" Key binding: F6 - Highlight search things Enable/Disable
set hlsearch
nmap <F6> :set hls!<BAR>set hls?<CR>

" Key binding: F7 - Create Ctag of current project.
nmap <F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Key binding: Ctrl+F7 - Create Ctag of current folder.
nmap <C-F7> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f '%:p:h\\tags' '%:p:h'<CR>


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
"  UI Style
"------------------------------
" Set color env
set t_Co=256

" Set background (dark/light)
set background=dark

" ColorScheme
"colorscheme wombat256mod_mmc
"colorscheme solarized

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
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ POS:\ %3*%l%4*/%3*%L%4*\:%3*%c%4*\ \<%2*%P%4*\>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

" Diff
if has('diff')
  hi DiffAdd ctermfg=Grey ctermbg=DarkBlue guifg=Grey
  hi DiffDelete ctermfg=Grey ctermbg=DarkRed guifg=Grey
  hi DiffChange ctermfg=Black ctermbg=DarkGreen guifg=Black
  hi DiffText ctermfg=White ctermbg=DarkRed guifg=Black
endif


"------------------------------
" Moving and tabs
"------------------------------
" Map space to / and c-space to ?
" Key binding: Space as /, foward search
"nmap <SPACE> /

" Key binding: Shift+Space as ?, backward search
"nmap <S-SPACE> ?

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
" Tab key binding
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
" Misc
"------------------------------
au BufReadPost * map K <ESC>
au BufReadPost *.pl   set keywordprg=perldoc\ -f
au BufReadPost *.vim  map K :exe ':help '.expand('<cword>')<CR>
au BufReadPost .vimrc map K :exe ':help '.expand('<cword>')<CR>

" Key binding: ,m - Remove the Windows ^M char
noremap <localleader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Super paste
inoremap <C-v> <ESC>:set paste<CR>mui<C-R>+<ESC>mv'uV'v=:set nopaste<CR>

" Key binding: ,, - Quick switch to normal mode
" noremap <LocalLeader>, <C-\><C-N>
" noremap! <LocalLeader>, <C-\><C-N>

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

" Dictionary
"set dictionary+=~/.vim/after/ftplugin/pydiction/complete-dict


"------------------------------
" External Application
"------------------------------
" Key binding: ,hex - View file in hex mode
nmap <localleader>hex :%!xxd<CR>

" Key binding: ,rhex - Return view file to normal mode from hex mode
nmap <localleader>rhex :%!xxd -r<CR>

" Key binding: ,d - Search the word under cursor in devhelp
"nmap <localleader>d viwy:!devhelp -s <C-R>"<CR>

" Key binding: ,p - Search the word under cursor in pydoc
"nmap <localleader>p viwy:!pydoc <C-R>"<CR>


"------------------------------
"  Comment
"------------------------------
"highlight Comment ctermfg=gray


"------------------------------
" Node.js dev environment
"------------------------------
"au BufNewFile,BufRead *.ejs set filetype=html

"------------------------------
" PHP dev environment
"------------------------------
if has("au")
  au BufEnter *.phtml set syn=php

  " highlights interpolated variables in sql strings and does sql-syntax highlighting.
  au FileType php let php_sql_query=1

  " does exactly that. highlights html inside of php strings
  au FileType php let php_htmlInStrings=1

  " discourages use oh short tags. c'mon its deprecated remember
  au FileType php let php_noShortTags=1

  " automagically folds functions & methods. this is getting IDE-like isn't it?
  au FileType php let php_folding=1

  " set auto-highlighting of matching brackets for php only
  "au FileType php DoMatchParen
  "au FileType php hi MatchParen ctermbg=blue guibg=lightblue
endif


"------------------------------
" Fix
"------------------------------
" Screen fix
"--------------------------------------------------
" if &term =~ '^screen'
"   set t_k1=^[[11~
"   set t_k2=^[[12~
"   set t_k3=^[[13~
"   set t_k4=^[[14~
" endif
"--------------------------------------------------


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
"nmap <C-h> :call MyReplace()<CR>

"------------------------------
" Save as Root
"------------------------------
cnoremap w!! w !sudo tee % >/dev/null


"------------------------------
" Plugins
"------------------------------

"------------------------------
" ScrollColor
"------------------------------
" Key binding: ,cn - Scroll next colorscheme
nmap <localleader>cn :NEXTCOLOR<CR>

" Key binding: ,cp - Scroll previous colorscheme
nmap <localleader>cp :PREVCOLOR<CR>


"------------------------------
"  Auto completion use neocomplcache
"------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Disable auto complate
let g:neocomplcache_disable_auto_complete = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Set neocomplcache temporary directory
let g:neocomplcache_temporary_dir = $HOME.'/.vim/neocompcache'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
au FileType css setl omnifunc=csscomplete#CompleteCSS
au FileType html setl omnifunc=htmlcomplete#CompleteTags
au FileType xml setl omnifunc=xmlcomplete#CompleteTags
au FileType php setl omnifunc=phpcomplete#CompletePHP
"au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
"au FileType javascript setl omnifunc=jscomplete#CompleteJS
au FileType javascript setl omnifunc=nodejscomplete#CompleteJS
au FileType python setl omnifunc=pythoncomplete#Complete
au FileType c setl omnifunc=ccomplete#Complete
au BufRead,BufNewFile *.py,*.c setl ai
au BufRead,BufNewFile *.py,*.c setl smartindent

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"au FileType ruby setl omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" JavaScript complete extension
" - dom.vim : Adding DOM keywords completion.
" - moz.vim : Adding Mozilla JavaScript keywords completion.
" - xpcom.vim : Adding Mozilla XPCOM component keywords completion.
" - es6th.vim : Adding ECMAScript 6th keywords completion.
let g:jscomplete_use = ['dom', 'moz']

" Node.js compeletion with jscomplete
let g:node_usejscomplete = 1

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

"------------------------------
" Tagbar
"------------------------------
" Set ctags path (essential on Mac OS X)
if has("mac") || has("gui_mac")
  let g:tagbar_ctags_bin = '/opt/local/bin/ctags'
  "let g:tagbar_type_javascript = {'ctagsbin' : '/usr/local/bin/jsctags'}
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
let g:tagbar_expand = 1


"------------------------------
" Ctags <From:Fourdallars>
"
" Must recompile ctags by tarball on Mac OS X
"------------------------------
" Set ctags path (essential on Mac OS X)
if has("mac") || has("gui_mac")
  let g:ctags_path = '/opt/local/bin/ctags'
else
  let g:ctags_path = '/usr/bin/ctags'
endif

" Set tags save path
set tags=./tags,./TAGS,tags,TAGS,~/.tags

" Key binding: g+ - View in new tab
nmap g+ viwy:tab ts <C-R>"<CR>
" Key binding: g- - View in new tab
nmap g- viwy:pts <C-R>"<CR>
" Key binding: g= - View in new stack
nmap g= viwy:sts <C-R>"<CR>
" Key binding: g+ - View in new tab
nmap g<BAR> viwy:vsplit<CR>:ts <C-R>"<CR>


"------------------------------
"  cscope setting
"------------------------------
if has("cscope")
  if has("mac") || has("gui_mac")
    set csprg='/opt/local/bin/cscope'
  else
    set csprg='/usr/bin/cscope'
  endif
  set csto=0
  set cst
  set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
  set csverb
  set cscopetag
  set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif


"------------------------------
" Source Explorer
"------------------------------
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"]

" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" Refresh time
let g:SrcExpl_refreshTime = 100

" Enable/Disable update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" Search Local definition
let g:SrcExpl_searchLocalDef = 0

" Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"


"------------------------------
" FuzzyFinder
"------------------------------
" Key binding: \fb - Buffer mode
nnoremap <leader>fb :FufBuffer! <CR>
nnoremap <localleader>fb :FufBuffer! <CR>

" Key binding: \ff - File mode
nnoremap <leader>ff :FufFile! <CR>

" Key binding: \fcd - Directory mode
nnoremap <leader>fcd :FufDir! <CR>

" Key binding: \fm - Bookmark mode
nnoremap <leader>fm :FufBookmark! <CR>

" Key binding: \ft - Tag mod
nnoremap <leader>ft :FufTag! <CR>

" Key binding: \fl - Jump-List mod
nnoremap <leader>fl :FufJumpLis! <CR>

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
" RTF Pygmentize
"------------------------------
" Valid options are: 'default', 'emacs', 'friendly' and 'colorful'
let g:rtfp_theme = 'emacs'
let g:rtfp_font = 'Menlo'

"Key binding: CMD+c - Copy colored source code to clipboard
"smap <D-c> :RTFPygmentize<CR>

"------------------------------
" Vimwiki
"------------------------------
let g:vimwiki_use_mouse = 1
"let g:vimwiki_list = [{'path': '$HOME/.vim/vimwiki/', 'path_html': '$HOME/.vim/vimwiki/html/', 'html_header': '$HOME/.vim/vimwiki/template/header.tpl',}]
let g:vimwiki_list = [{'path': '$HOME/vimwiki/', 'path_html': '$HOME/vimwiki/html/'}]

noremap \h :VimwikiAll2HTML<CR>


"------------------------------
" Gundo
"------------------------------
nnoremap \u :GundoToggle<CR>
let g:gundo_width = 45
let g:gundo_preview_height = 15
let g:gundo_right = 0


"------------------------------
"  CheckSyntax
"------------------------------
" Key binding: assign :CheckSyntax to ,cs
noremap <localleader>cs :CheckSyntax<cr>


"------------------------------
"  JSLint
"------------------------------
if &ft != 'javascript'
  nnoremap \js :JSLintToggle<CR>
  nnoremap \jsu :JSLintUpdate<CR>
  "au VimEnter *  call JSLintToggle()
  let g:JSLintHighlightErrorLine = 0
endif

"------------------------------
"  CheckSyntax
"------------------------------
let $JS_CMD='node'


"------------------------------
"  Colorizer
"------------------------------
" Key binding: assign :ColorToggle to ,ct
let g:colorizer_nomap = 1
noremap <localleader>ct :ColorToggle<CR>


"------------------------------
"  Zen Coding
"------------------------------
" Key binding: reassign trigger key
"let g:user_zen_expandabbr_key = '<c-e>'
"let g:use_zen_complete_tag = 1

"------------------------------
"  Vim-Markdown
"------------------------------
" Disable Folding
let g:vim_markdown_folding_disabled=1

" Set Initial Foldlevel
let g:vim_markdown_initial_foldlevel=0


"------------------------------
"  External diff setting
"------------------------------
let g:DirDiffDynamicDiffText = 1
