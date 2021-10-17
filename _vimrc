"------------------------------------------------------------
"
" Vim / NeoVim configure file.
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
" Vim-Plug
"------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugins')

" Colorscheme
Plug 'agude/vim-eldar'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'hzchirs/vim-material'
Plug 'vim-scripts/tir_black'

" UI
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'liuchengxu/vista.vim'
Plug 'Shougo/echodoc.vim'
Plug 'mhinz/vim-signify'
Plug 'luochen1990/rainbow'

" File Management
Plug 'tpope/vim-fugitive'

" Editing
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'benjifisher/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
" Plug 'scrooloose/vim-slumlord'

" Syntax
Plug 'mrk21/yaml-vim'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'

" Language Server / Auto Completion / Snippets
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neco-syntax'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
" Plug 'yami-beta/asyncomplete-omni.vim'
if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif

" For Golang Development
Plug 'fatih/vim-go', {'for': 'go'}
" Plug 'mdempsky/gocode', {'rtp': 'vim/'}
" Plug 'sebdah/vim-delve'

" For Rust Development
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" For Ruby / Rails Development
Plug 'tpope/vim-rails', {'for': ['ruby', 'eruby']}

" For Dart / flutter Development
Plug 'dart-lang/dart-vim-plugin', {'for': ['dart']}
Plug 'thosakwe/vim-flutter', {'for': ['dart']}

" For Puppet Development
Plug 'rodjek/vim-puppet'

" For HashiCorp tools
Plug 'hashivim/vim-terraform', {'for': 'terraform'}

" Utilities
Plug 'vimwiki/vimwiki'

" External Utilities
Plug 'benmills/vimux'

" Initialize plugin system
call plug#end()

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

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
			\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
			\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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

" Minimal number of screen lines to keep above and below the cursor (default: 0)
set scrolloff=3

" Incremental search
set incsearch

" Highlight search things
set hlsearch

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
"  UI Style
"------------------------------
" Set color env
if !has('gui_running')
    set t_Co=256
endif

" set Vim-specific sequences for RGB colors
" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Set background (dark/light)
set background=dark

" Set colorscheme
augroup coloroverride
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=underline ctermfg=NONE gui=underline guifg=NONE
  autocmd ColorScheme * highlight DiffAdd cterm=reverse,bold ctermfg=green ctermbg=NONE
  autocmd ColorScheme * highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight DiffDelete cterm=reverse,bold ctermfg=red ctermbg=NONE
  autocmd ColorScheme * highlight DiffText cterm=reverse,bold ctermfg=yellow ctermbg=NONE
augroup END
silent! colorscheme eldar

" colorscheme onehalfdark
" let g:solarized_termtrans = 1
" colorscheme solarized

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

" GUI Cursor Shape
set guicursor=

"------------------------------
" Edit setting
"------------------------------
" Enable persistent undo so that undo history persists across vim sessions
" if !isdirectory($HOME."/.vim")
    " call mkdir($HOME."/.vim", "", 0770)
" endif
" if !isdirectory($HOME."/.vim/vimundo")
    " call mkdir($HOME."/.vim/vimundo", "", 0700)
" endif
" set undodir=~/.vim/vimundo
" set undofile

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
            \ set shiftwidth=8 |

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

" Key binding: ,big5 - Convert file encoding to big5 nmap <localleader>big5 :set fileencoding=big5<CR>

" Key binding: ,utf8 - Convert file encoding to utf8
nmap <localleader>utf8 :set fileencoding=utf8<CR>

" Key binding: ,fd - Convert current file to dos format
nmap <localleader>fd :set ff=dos<CR>

" Key binding: ,fu - Convert current file to unix format
nmap <localleader>fu :set ff=unix<CR>

"------------------------------
" Key mappings
"------------------------------
" Auto Completion
" Key-mapping: <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>CRComplete()<CR>
function! s:CRComplete()
    " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" Key-mapping: Close popup by <Space>
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Using [TAB] and [SHIFT-TAB] to indent on Normal mode
nmap <TAB> V>
nmap <S-TAB> V<
xmap <TAB> >gv
xmap <S-TAB> <gv

" Window move cursor key binding
" Smart way to move between windows
" Key binding: Ctrl+j - move to bottom window
nmap <C-j> <C-W>j
" Key binding: Ctrl+k - move to up window
nmap <C-k> <C-W>k
" Key binding: Ctrl+h - move to right window
nmap <C-h> <C-W>h
" Key binding: Ctrl+l - move to left window
nmap <C-l> <C-W>l

" Tabs key binding
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
    " set switchbuf=useopen/usetab
    set switchbuf=usetab
    set stal=2
catch
endtry

" Save as Root
cnoremap w!! w !sudo tee % >/dev/null

" Ignore Ex mode
noremap Q :qa

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
" External Application
"------------------------------
" Key binding: ,hex - View file in hex mode
nmap <localleader>hex :%!xxd<CR>

" Key binding: ,rhex - Return view file to normal mode from hex mode
nmap <localleader>rhex :%!xxd -r<CR>

"------------------------------------------------------------
" Plugins
"------------------------------------------------------------
"------------------------------
" vim-lsp
"------------------------------
" Auto enable vim-lsp plugin during startup
let g:lsp_auto_enable = 1

" Enables echo/floating window of diagnostic error for the current line to status
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_diagnostics_float_cursor = 1

" Delay milliseconds to echo/floating window of diagnostic error for the current line to status
let g:lsp_diagnostics_echo_delay = 200
" let g:lsp_diagnostics_float_delay = 500

" Enable support for document diagnostics
let g:lsp_diagnostics_enabled = 1

" Enables signs for diagnostics
let g:lsp_diagnostics_signs_error = {'text': '✖'}
let g:lsp_diagnostics_signs_warning = {'text': '●'}
let g:lsp_diagnostics_signs_hint = {'text': '?'}
let g:lsp_diagnostics_signs_information = {'text': 'i'}

" Enables signs for code actions
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_code_action_signs_hint = {'text': 'A>'}

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.vim/vim-lsp.log')

" Keep the focus in current window
" let g:lsp_preview_keep_focus = 1

" Opens preview windows as floating
let g:lsp_preview_float = 1

" Preview closes on cursor move
let g:lsp_preview_autoclose = 1

" Enable support for completion insertText property
let g:lsp_insert_text_enabled = 1

" Enable support for completion textEdit property
let g:lsp_text_edit_enabled = 1

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal completefunc=lsp#complete
  " set formatexpr=LanguageClient_textDocument_rangeFormatting()
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  " Key bindings
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <leader>gd <plug>(lsp-definition)
  nmap <buffer> <leader>gt :tab LspDefinition<CR>
  nmap <buffer> <leader>gh <plug>(lsp-hover)
  nmap <buffer> <leader>gi <plug>(lsp-implementation)
  nmap <buffer> <leader>gr <plug>(lsp-references)
  nmap <buffer> <F2> <plug>(lsp-rename)

  nmap <buffer> <leader>sc <plug>(lsp-document-diagnostics)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> <leader>sn <plug>(lsp-next-diagnostic)
  nmap <buffer> <leader>sN <plug>(lsp-previous-diagnostic)
  nmap <buffer> <leader>sp <plug>(lsp-previous-diagnostic)

  nmap <buffer> <leader>sa <plug>(lsp-code-action)

  " Scroll current displayed floating/popup window with specified count
  inoremap <buffer> <expr><C-f> lsp#scroll(+4)
  inoremap <buffer> <expr><C-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre <buffer> call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

  " autocmd BufWritePre <buffer> call execute('LspCodeActionSync source.organizeImports')
  " autocmd BufWritePre <buffer> LspDocumentFormatSync
augroup END

" let g:lsp_settings = {
" \  'gopls': {'disabled': v:true}
" \}

let g:lsp_settings_root_markers = [
      \ 'go.mod',
      \ '.git',
      \ '.git/',
      \ '.svn',
      \ '.hg',
      \ '.bzr'
      \ ]

" Close preview window
autocmd CompleteDone * pclose

"------------------------------
" asyncomplete.vim
"------------------------------
let g:asyncomplete_auto_popup = 0

" Register asynccomplete-omni.vim
" autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
      " \ 'name': 'omni',
      " \ 'allowlist': ['*'],
      " \ 'blocklist': ['c', 'cpp', 'html'],
      " \ 'completor': function('asyncomplete#sources#omni#completor'),
      " \ 'config': {
      " \   'show_source_kind': 1,
      " \ },
      " \ }))

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif

function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
           \ pumvisible() ? "\<C-n>" :
           \ <SID>check_back_space() ? "\<TAB>" :
           \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" "------------------------------
" Set Python binary path
" "------------------------------
" let g:python3_host_prog = expand('/opt/local/bin/python3.6')

"------------------------------
" vim-go
"------------------------------
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 0

"------------------------------
" fzf.vim
"------------------------------
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
      \ 'ctrl-t': 'GotoOrOpen tab',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Key Mappings
nnoremap <C-g>b :Buffers <CR>
nnoremap <C-g>w :Windows <CR>
nnoremap <C-g>g :Ag <CR>
nnoremap <C-g>r :Ag <C-r>"<CR>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :call FzfOmniFiles()<CR>

fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfun

" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--word-regexp', <bang>0)

"------------------------------
" vista.vim
"------------------------------
" The icons used to indicate open or close folds
let g:vista_fold_toggle_icons = ['▼', '▶']

" How each level is indented and what to prepend.
let g:vista_icon_indent = ['▸ ', '']

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
" lcn / ale
let g:vista_executive_for = {
            \ 'go': 'vim_lsp',
            \ 'ruby': 'vim_lsp',
            \ 'php': 'vim_lsp',
            \ 'javascript': 'vim_lsp',
            \ 'javascript.jsx': 'vim_lsp',
            \ 'typescript': 'vim_lsp',
            \ 'yaml': 'vim_lsp',
            \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
            \ 'haskell': 'hasktags -x -o - -c',
            \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
" let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 0

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

" Width of vista sidebar
let g:vista_sidebar_width = 35

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" autocmd VimEnter * nested vista#RunForNearestMethodOrFunction()

"------------------------------
" echodoc
"------------------------------
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

"------------------------------
" Nerd Commenter
"------------------------------
let NERDSpaceDelims = 1

"------------------------------
" Indent Guides
"------------------------------
" if has("gui_macvim")
let g:indent_guides_enable_on_vim_startup = 1
" end
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
" au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

"------------------------------
"  Status bar: lightline
"------------------------------
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'method' ], ['ctrlpmark'] ],
  \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component': {
  \ },
  \ 'component_function': {
  \   'modified': 'LightlineModified',
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \   'method': 'NearestMethodOrFunction',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   'mode': 'LightlineMode',
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

fun! LightlineModified()
  return &ft =~ 'help\|vimfiler\|Mundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

fun! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|Mundo' && &readonly ? '⨂' : ''
endfunction

fun! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:f') ? expand('%:f') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

fun! LightlineFugitive()
  if &ft !~? 'vimfiler\|Mundo' && exists("*FugitiveHead")
    let _ = FugitiveHead()
    return strlen(_) ? '⚑ '._ : ''
  endif
  return ''
endfunction

fun! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

fun! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

fun! LightlineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

fun! LightlineMode()
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
" vim-signify
"------------------------------
" highlight signs in Sy
" highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=119
" highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=167
" highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=227
highlight SignColumn cterm=NONE ctermbg=NONE gui=NONE guibg=NONE

let g:signify_vcs_list              = [ 'git', 'hg' ]
let g:signify_cursorhold_insert     = 1
let g:signify_cursorhold_normal     = 1
let g:signify_update_on_bufenter    = 0
let g:signify_update_on_focusgained = 1

nnoremap <leader>st :SignifyToggle<CR>
nnoremap <leader>sh :SignifyToggleHighlight<CR>
nnoremap <leader>sr :SignifyRefresh<CR>
nnoremap <leader>sd :SignifyDebug<CR>

" hunk jumping
" ]c   Jump to the next hunk.
" [c   Jump to the previous hunk.
" ]C   Jump to the last hunk.
" [C   Jump to the first hunk.
" nmap <leader>sj <plug>(signify-next-hunk)
" nmap <leader>sk <plug>(signify-prev-hunk)

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

"------------------------------
" vim-mundo
"------------------------------
nnoremap <leader>u :MundoToggle<CR>
let g:mundo_width = 45
let g:mundo_preview_height = 15
let g:mundo_right = 0

"------------------------------
" vim-json
"------------------------------
let g:vim_json_syntax_conceal = 0

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
" Vimux
"------------------------------
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

"------------------------------
" Rainbow Parentheses Improved
"------------------------------
" Set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
