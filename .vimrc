" set nowrap
set nocompatible
" set rubydll=~/.rbenv/versions/2.3.6/lib/libruby.2.3.dylib
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
" set clipboard=unnamed

" TODO {{''{
" - fix spring/turn on off
" - create a SQL runner
"     - change a file
"     - opens a buffer that has the output to the file
" - easily create files that are under folders that don't exist yet (mkdir -p)
" - DONE: Creating files when the parent folder does not even exist for tests. See 'mkdir -p'
" - Copy relative filepath to buffer
" - DONE: Open accompanying test
" - Open accompanying source code
" - Refresh buffers without many losing color-scheme
"
" - create folders
" - Go through all examples of Learn Vimscript the Hard Way

" - Suggest branch deletion to vim figutive
"
" - Write more operator-pending mappings (i.e. next function, describe, it,
"   etc.)
" - Install syntastic checkers (Ruby, Arduino, HTML, CSS, SASS)
"
" - vim-jasmine
"   - run test under cursor
"     * basically get the describe blocks string and concatenate
"     * convert spaces in the concatenation to '%20'
"     * run capybara with the proper URL
"     * wait if NOT all green
"     * quit if finished and all green
"   - run whole file
"   - run last test
"   - run all jasmine specs
"
" - Git shortcuts
"   - Adding the pivotal tracker tag to the commit (from the branch)
"   - Finishing merging
"     - git fetch dev-staging
"     - git rebase origin/dev-staging
"     - git checkout dev-staging
"     - git merge last-branch
"     - git br -d last-branch
"     - git push origin :last-branch
"     - git push origin dev-staging
"     - git push heroku staging dev-staging:master
"   - push/pull/fetch current branch
" - JS
"    - wrap selection between function block
"    - copy arguments of constructor and make them properties in its context.
"
" - wrapping a whole line with a tag (excluding whitespaces at the ends)
"
" - Jasmine
"   - spyOn();
"   - open associated file of test.
"   - move the var declarations to the outside of the beforeEach
"   - shortcut to quickly create spec.js and javascript files in the right
"   folder
" - Coffee jasmine shortcut for ex...toHaveBeenCalled() and to HaveBeenCalledWith()
" - autocmd block
"
" - Ruby
"   requiring the item only once?
"   - debugging
"     - separate the line into disparate objects and
"     - print each value of the object
"     - binding.pry shortcut
" }}}

" Plugins {{{{{{
" required
filetype off
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'majutsushi/tagbar'
Plugin 'AndrewRadev/vim-eco'
Plugin 'scrooloose/syntastic'
Plugin 'JuliaLang/julia-vim'
Plugin 'lervag/vimtex'


" Layout Balancing"{{{
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
""}}}

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for faq
" put your non-plugin stuff after this line
" }}}
"}}}
" set nowrap
set nocompatible
" set rubydll=~/.rbenv/versions/2.3.6/lib/libruby.2.3.dylib
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
" set clipboard=unnamed

" TODO {{''{
" - fix spring/turn on off
" - create a SQL runner
"     - change a file
"     - opens a buffer that has the output to the file
" - easily create files that are under folders that don't exist yet (mkdir -p)
" - DONE: Creating files when the parent folder does not even exist for tests. See 'mkdir -p'
" - Copy relative filepath to buffer
" - DONE: Open accompanying test
" - Open accompanying source code
" - Refresh buffers without many losing color-scheme
"
" - create folders
" - Go through all examples of Learn Vimscript the Hard Way

" - Suggest branch deletion to vim figutive
"
" - Write more operator-pending mappings (i.e. next function, describe, it,
"   etc.)
" - Install syntastic checkers (Ruby, Arduino, HTML, CSS, SASS)
"
" - vim-jasmine
"   - run test under cursor
"     * basically get the describe blocks string and concatenate
"     * convert spaces in the concatenation to '%20'
"     * run capybara with the proper URL
"     * wait if NOT all green
"     * quit if finished and all green
"   - run whole file
"   - run last test
"   - run all jasmine specs
"
" - Git shortcuts
"   - Adding the pivotal tracker tag to the commit (from the branch)
"   - Finishing merging
"     - git fetch dev-staging
"     - git rebase origin/dev-staging
"     - git checkout dev-staging
"     - git merge last-branch
"     - git br -d last-branch
"     - git push origin :last-branch
"     - git push origin dev-staging
"     - git push heroku staging dev-staging:master
"   - push/pull/fetch current branch
" - JS
"    - wrap selection between function block
"    - copy arguments of constructor and make them properties in its context.
"
" - wrapping a whole line with a tag (excluding whitespaces at the ends)
"
" - Jasmine
"   - spyOn();
"   - open associated file of test.
"   - move the var declarations to the outside of the beforeEach
"   - shortcut to quickly create spec.js and javascript files in the right
"   folder
" - Coffee jasmine shortcut for ex...toHaveBeenCalled() and to HaveBeenCalledWith()
" - autocmd block
"
" - Ruby
"   requiring the item only once?
"   - debugging
"     - separate the line into disparate objects and
"     - print each value of the object
"     - binding.pry shortcut
" }}}

" Plugins {{{{{{
" required
filetype off
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'majutsushi/tagbar'
Plugin 'AndrewRadev/vim-eco'
Plugin 'scrooloose/syntastic'
Plugin 'JuliaLang/julia-vim'
Plugin 'lervag/vimtex'


" Layout Balancing"{{{
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
""}}}

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for faq
" put your non-plugin stuff after this line
" }}}
"}}}
" Faster Grepping. http://robots.thoughtbot.com/faster-grepping-in-vim {{{
" The Silver Searcher
if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Use ag in CTRL-P for listing files, Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -U --skip-vcs-ignores --ignore="*data*" --ignore="tags"'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 1
endif

" Map K to search the word underneath the cursor and return results in a new
" window.
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap \ :Ag<SPACE>--ignore="*data*" --ignore="tags"<Space>
" }}}

" General {{{
" Erase all the autocommands

" colorscheme vividchalk
let mapleader = "\<Space>"

" pasting from clipboard without mangling text
nnoremap <Leader>pa :set invpaste paste?<CR>
" set pastetoggle=<F2>
set showmode

nnoremap <Leader>fp :let @" = expand("%")<cr>

" move current buffer to different path
nnoremap <leader>mv :call RenameFile()<CR>

" copy highlighted text
vnoremap <Leader>cp "+y

" copy paragraph to system buffer
nnoremap <Leader>pcp :let @+ = expand("%")<CR>

" copy paragraph to system bufferr
nnoremap <Leader>cp "*yap

" tagbar mappings
nmap <F8> :TagbarToggle<CR>

" Manuals
runtime! ftplugin/man.vim

" Julia
runtime macros/matchit.vim
let g:latex_to_unicode_auto = 1


" Remove whitespace
nnoremap <Space>tw :%s/\s\+$//<CR>

" Ignore files in netrw
let g:netrw_list_hide= '.*\.un\~$'

" Don't use swap files
set nobackup
set noswapfile

" Undo file
set undofile

" autosave when you lose focus
au FocusLost * :wa

" Copy whole file and go back to section
nnoremap <Leader>yf :%y+<cr>

" buffer shortcuts
nnoremap <Leader>bp :bp<cr>
nnoremap <Leader>bn :bn<cr>
nnoremap <Leader>ls :ls<cr>

" toggle no wrap
nnoremap <Leader>snw :set nowrap<cr>

" generate spec
nnoremap <Leader>gf :call GenerateFilePair()<cr>

" navigate to a different window {{{
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
" }}}

" search {{{
" searching with all lowercase will make case insensitive
" searching with at least one upper case will make case sensitive
set incsearch
set showmatch
set hlsearch

" search and replace on file globally by default
set gdefault

nnoremap <Leader>gs :Gsearch<CR>
nnoremap <Leader>gr :Greplace<CR>

" turn off highlights once done with a search
nnoremap <leader><leader> :noh<cr>
" }}}

" Before saving a file/buffer {{{
augroup Before_saving_a_file_or_buffer
autocmd!
" trim whitespace
autocmd BufWritePre,FileWritePre * :%s/\s\+$//e
augroup end
" }}}

" Go to shell {{{
nnoremap <Leader>sh :shell<CR>
" }}}

" Q to save {{{
inoremap QQ <Esc>:w<CR>
nnoremap Q :w<CR>
" }}}

" create a scratch buffer {{{
nnoremap <Leader>sc :call Scratch()<CR>
nnoremap <Leader>sm :call ScratchMarkdown()<CR>
"}}}

" create new file same directory {{{
nnoremap <leader>nfsd : Scratch()<CR>
"}}}


" Functions {{{
"function! OpenTestOrSourceFile()
"ruby <<EOF
"EOF
"endfunction
"

function! VtrSendVisuallySelectedCommand()
" ruby <<EOF
" command = Vim.evaluate("getline(\"'<\")[getpos(\"'<\")[2]-1:getpos(\"'>\")[2]-1]")
" Vim.command("call VtrSendCommand('#{command}')")
" EOF
endfunction

function! Scratch()
  :new<CR>
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunction

function! ScratchMarkdown()
  :new<CR>
  setlocal filetype=Markdown
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunction

" Vertically space out really long horizontal lines
nnoremap <leader>, :call SeparateCommaSeparatedValuesIntoLines()<cr>

" Shortcut for Escape {{{
inoremap jk <Esc>
vnoremap jk <Esc>
cnoremap JK <Esc>

inoremap JK <Esc>
vnoremap JK <Esc>
cnoremap jk <Esc>
" }}}

" capitalize {{{
nnoremap <leader>cap ebgUl
"}}}

" reselect the text that was just pasted (so you can perform commands on it)
nnoremap <leader>v V`]

" edit aliases
nnoremap <leader>ea :vsp $DOTFILES_PATH/.aliases<cr>

" Source/edit vimrc, .bash_profile {{{
" Source/edit vimrc
" nnoremap <leader>sv :source $MYVIMRC<cr>
" nnoremap <leader>ev :tabe $MYVIMRC<CR>

" Source/edit .bash_profile
nnoremap <leader>sb :!source ~/.zshrc<cr>
nnoremap <leader>eb :vsp ~/.zshrc<cr>
" }}}

" edit pgit configuration file
nnoremap <leader>ep :vsp ~/.pgit.rc.yml<cr>
"


" Git {{{
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gdc :Git diff --cached<CR>
nnoremap <Leader>gca :Git commit --amend<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>gcm :Gcommit<CR>
nnoremap <Leader>ggr :Ggrep<CR>
nnoremap <Leader>gmo :Gmove<Space>
nnoremap <Leader>grm :Gremove<CR>
nnoremap <Leader>grd :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gbw :Gbrowse<CR>
nnoremap <Leader>gt :Git<Space>
nnoremap <Leader>gpsh :Git push origin HEAD<CR>
nnoremap <Leader>gap :Git add --patch<CR>
nnoremap <Leader>gap% :Git add --patch %<CR>
nnoremap <Leader>ga% :Git add %<CR>

set statusline=%F    " Path to the file
set statusline+=%=   " Switch to the right side
set statusline+=%P   " Current line to # total lines percentage
set statusline+=\    " Add a space
set statusline+=%{fugitive#statusline()}   " Show current branch
"}}}

" edit ~/.gitconfig
nnoremap <Leader>eg :vsp ~/.gitconfig<CR>

" Context-dependent numbering {{{
augroup Numbering
  autocmd!
  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber
  autocmd BufRead * :set relativenumber
augroup end
" }}}

" Indentation Settings {{{
" tabbing stuff, 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
" }}}

" tabs {{{
nnoremap ¡ 1gt
nnoremap ™ 2gt
nnoremap £ 3gt
nnoremap ¢ 4gt
nnoremap ∞ 5gt
nnoremap § 6gt
nnoremap ¶ 7gt
nnoremap • 8gt
nnoremap ª 9gt
nnoremap º :tablast<CR>
inoremap ¡ <esc>1gt
inoremap ™ <esc>2gt
inoremap £ <esc>3gt
inoremap ¢ <esc>4gt
inoremap ∞ <esc>5gt
inoremap § <esc>6gt
inoremap ¶ <esc>7gt
inoremap • <esc>8gt
inoremap ª <esc>9gt
inoremap º <esc>:tablast<CR>
" ALT-h and ALT-l for quicker tab cycling
inoremap ¬ <Esc>gt<CR>
inoremap ˙ <Esc>gT<CR>
nnoremap ¬ gt
nnoremap ˙ gT
" }}}
" Reindent the whole file {{{
nnoremap <Leader>if magg=G`a
" }}}

" move lines up and down quickly (Alt + j/k) {{{
nnoremap <D-j> :m .+1<CR>==
nnoremap <D-k> :m .-2<CR>==
inoremap <D-j> <Esc>:m .+1<CR>==gi
inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap <D-j> :m '>+1<CR>gv=gv
vnoremap <D-k> :m '<-2<CR>gv=gv
" }}}

" move vertically by visual line {{{
nnoremap j gj
nnoremap k gk
" }}}

" Window adjustment {{{

set rnu
set showcmd
set ruler
set so=0
set autoread
" }}}

" Insert mode centering in between character pairs {{{
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap " ""<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap \| <Bar><Bar><Left>
inoremap < <><Left>
" }}}

" Remappings {{{
" move to the end.
nnoremap L $
onoremap L $
vnoremap L $

" move to the first non-whitespace character on the current line.
nnoremap H ^
onoremap H ^
vnoremap H ^
" }}}

" Copy word/WORD under cursor {{{
nnoremap <Leader>cw viw"+y
nnoremap <Leader>cW viW"+y
" }}}

" Wrappings {{{
" Wrap selection {{{

" Wrap line with '
nnoremap <Leader>'l :call WrapLineWith("'", "'", "")<CR>

nnoremap <Leader>'l+ :call WrapLineWith("'", "'", " \+")<CR>

nnoremap <Leader>"l+ :call WrapLineWith('"', '"', " \+")<CR>

" wrap a word under the cursor with single quotes.
" nnoremap <Leader>'w viw<Esc>bi'<Esc>lea'
nnoremap <Leader>'w :call WrapWordWith("'", "'", 'w')<CR>

" wrap a Word under the cursor with single quotes.
nnoremap <Leader>'W :call WrapWordWith("'", "'", 'W')<CR>

" wrap a word under the cursor with double quotes.
nnoremap <Leader>"w :call WrapWordWith('"', '"', 'w')<CR>

" wrap a Word under the cursor with double quotes.
nnoremap <Leader>"W :call WrapWordWith('"', '"', 'W')<CR>

" wrap a word under the cursor with braces.
nnoremap <Leader>[w :call WrapWordWith('[', ']', 'w')<CR>

" wrap a Word under the cursor with braces.
nnoremap <Leader>[W :call WrapWordWith('[', ']', 'W')<CR>

" wrap a word under the cursor with curly braces.
nnoremap <Leader>{w :call WrapWordWith('{', '}', 'w')<CR>

" wrap a Word under the cursor with curly braces.
nnoremap <Leader>{W :call WrapWordWith('{', '}', 'W')<CR>

" wrap a word under the cursor with parenthesis.
nnoremap <Leader>(w :call WrapWordWith('(', ')', 'w')<CR>

" wrap a Word under the cursor with parenthesis.
nnoremap <Leader>(W :call WrapWordWith('(', ')', 'W')<CR>

" wrap a word under the cursor with greater than/less than signs.
nnoremap <Leader><w :call WrapWordWith('<', '>', 'w')<CR>

" wrap a Word under the cursor with greater than/less than signs.
nnoremap <Leader><W :call WrapWordWith('<', '>', 'W')<CR>

" wrap a word under the cursor with a pair of tildes.
nnoremap <Leader>`w :call WrapWordWith('`', '`', 'w')<CR>

" wrap a Word under the cursor with a pair of tildes.
nnoremap <Leader>`W :call WrapWordWith('`', '`', 'W')<CR>

" wrap selection with single quotes
vnoremap <Leader>' :call WrapSelectionWith("'", "'")<CR>

" wrap selection with double quotes
vnoremap <Leader>" :call WrapSelectionWith('"', '"')<CR>

" wrap selection with curly braces
vnoremap <Leader>{ :call WrapSelectionWith('{', '}')<CR>

" wrap selection with braces
vnoremap <Leader>[ :call WrapSelectionWith('[', ']')<CR>

" wrap selection with parenthesis
vnoremap <Leader>( :call WrapSelectionWith('(', ')')<CR>

" wrap selection with greater than/less than signs
vnoremap <Leader>< :call WrapSelectionWith('<', '>')<CR>

" wrap selection with tildes
vnoremap <Leader>` :call WrapSelectionWith('`', '`')<CR>
" }}}

" Operator-Pending Mappings {{{
" inside next/previous parenthesis
onoremap in( :<C-u>normal! f(vi(<Cr>
onoremap il( :<C-u>normal! F)vi(<Cr>

" around next/previous parenthesis
onoremap an( :<C-u>normal! f(va(<Cr>
onoremap al( :<C-u>normal! F)va(<Cr>

" inside next/previous curly braces
onoremap in{ :<C-u>normal! f{vi{<Cr>
onoremap il{ :<C-u>normal! F}vi{<Cr>

" around next/previous curly braces
onoremap in{ :<C-u>normal! f{va{<Cr>
onoremap il{ :<C-u>normal! F}va{<Cr>
" }}}
" }}}
" }}}

"
nnoremap <Leader>cr :!ctags  --recurse=yes --exclude=.git --exclude=BUILD --exclude=.svn --exclude=@.ctagsignore<cr>

" Open playground
nnoremap <Leader>pl :tabe playground.sql<CR>
"
"Open todo-list
nnoremap <Leader>todo :vsp todo.markdown<CR>

nnoremap <Leader>ks :call KillSpring()<CR>


augroup RSpec
  autocmd!
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> su' isubject do<CR>end<Esc>k2==o
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> de' describe "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> co' context "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> it'' it "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> sp' specify "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> be' before(:each) {}<Esc>==f}i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> bed' before(:each) do<CR>end<Esc>O
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> ex' expect().to<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> exs' page.execute_script()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> evs' page.evaluate_script()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> exh' expect().to have_received()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> exhw' expect().to have_received().with()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> ex{' expect{}.to<Esc>==f}i

  " shortcut for let
  autocmd BufNewFile,BufRead *spec.rb nnoremap <buffer> le ilet(:)<Space>do<CR><CR>end<CR><Esc>3k3==^f:a
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> ar' allow().to receive()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> arr' allow().to receive().and_return()<Esc>==f)i

  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> arw' allow().to receive().with()<Esc>==f)i

  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> arwr' allow().to receive().with().and_return()<Esc>==f)i

  " double('') shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> dou' double("")<left><left>

  " instance_double('') shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> idou' instance_double("")<left><left>

  " class_double('') shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> cdou' class_double("")<left><left>

  " create shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> cr' create()<left>

  " convert expect().to have_received to allow().to receive
  autocmd BufNewFile,BufRead *spec.rb nnoremap <buffer> <Leader>ar /expect<CR>Ncwallow<Esc>/have_received<CR>cwreceive<Esc>

  " convert expect().to have_received to allow().to receive
  autocmd BufNewFile,BufRead *spec.rb nnoremap <buffer> <Leader>ex /allow<CR>Ncwexpect<Esc>/receive<CR>cwhave_received<Esc>
augroup end

augroup Ruby
  autocmd!
  autocmd Filetype Ruby nnoremap <buffer> <Leader>eai aeach<Space>do \|i\|<Enter>end<Esc><Up>2==o
  autocmd Filetype Ruby nnoremap <buffer> <Leader>ea aeach<Space>do <Enter>end<Esc><Up>2==o
  autocmd Filetype ruby nnoremap <buffer> <Leader>oa :call OpenAssociatedFile()<CR>
  autocmd Filetype ruby nnoremap <buffer> <Leader>bmm Orequire 'benchmark'; puts Benchmark.measure {  }<Left><Left><Esc>
  autocmd Filetype ruby nnoremap <buffer> <Leader>sp Orequire 'stackprof'; StackProf.run(mode: :wall, out: 'tmp/.dump') {  }<Esc>F/a
  " insert debugger to method
  autocmd Filetype ruby nnoremap <buffer> <Leader>idl orequire 'pry'; binding.pry<Esc>

  " insert debugger to method
  autocmd Filetype ruby nnoremap <buffer> <Leader>idm :call AddDebugLineToEachMethod()<CR>

  " delete debugger from whole file
  autocmd Filetype ruby nnoremap <buffer> <Leader>db idebugger<Esc>==
  autocmd Filetype ruby nnoremap <buffer> <Leader>dd :call Delete("require 'pry'; binding.pry")<CR>
  autocmd Filetype ruby nnoremap <buffer> <Leader>td :call Toggle("require 'pry'; binding.pry")<CR>
  autocmd Filetype ruby vnoremap <buffer> <Leader>/ :call Comment("#")<CR>
  autocmd Filetype ruby nnoremap <buffer> <Leader>/ :call Comment("#")<CR>
  " shortcut for module end
  autocmd Filetype ruby inoremap <buffer> mo' module <CR>end<Esc>kA
  " shortcut for class end
  autocmd Filetype ruby inoremap <buffer> cl' class <CR>end<Esc>kA
  " shortcut for def end
  autocmd Filetype ruby inoremap <buffer> def' def <CR>end<Esc>kA
  " inline def; ;end
  autocmd Filetype ruby inoremap <buffer> defi' def ; ;end<Esc>F;;i
  " shortcut for string interpolation
  autocmd Filetype ruby inoremap <buffer> #{ #{}<Left>
  " wrap with string interpolation tag
  autocmd Filetype ruby nnoremap <buffer> <Leader>#{ viW<Esc>a}<Esc>Bi#{<Esc>
  " require shortcut
  autocmd Filetype ruby inoremap <buffer> req' require ''<Left>
  " require_relative shortcut
  autocmd Filetype ruby inoremap <buffer> reqr' require_relative ''<Left>

  " while loop
  autocmd Filetype ruby inoremap <buffer> wh' while  do<CR>end<Esc>ke2<Right>i

  " until loop
  autocmd Filetype ruby inoremap <buffer> un' until  do<CR>end<Esc>ke2<Right>i

  " do end block
  autocmd Filetype ruby inoremap <buffer> do' do<CR>end<Esc>O

  " do end block with block params
  autocmd Filetype ruby inoremap <buffer> do<Bar>' do <Bar><Bar><CR>end<Esc>kf<Bar>a

  " convert {} to do-end block while inside {}
  autocmd Filetype ruby nnoremap <buffer> <Leader>doe :cal DoEndifyCurlyBraces()<CR>

  " convert {| to {||}
  autocmd Filetype ruby inoremap <buffer> {<Bar> {<Bar><Bar>}<Left><Left>

  " debugging puts a variable
  autocmd Filetype ruby nnoremap <buffer> <Leader>p v$<Left>o^yOputs ""<Esc>P<Down>^Iputs <Esc>

  " if-else block
  autocmd Filetype ruby inoremap <buffer> ifs' if <CR>else<CR>end<Up><Up><Esc>A

  " if block
  autocmd Filetype ruby inoremap <buffer> if' if <CR><CR>end<Up><Up><Esc>A

  " else statement
  autocmd Filetype ruby inoremap <buffer> el' else<Esc>==A<Space>

  " when statement
  autocmd Filetype ruby inoremap <buffer> wn' when<Esc>==A<Space>

  " then statement
  autocmd Filetype ruby inoremap <buffer> th' then<Space>

  " case statement
  autocmd Filetype ruby inoremap <buffer> ca' case <CR>end<Esc><Up>2==A

  " require pry
  autocmd Filetype ruby nnoremap <buffer> <Leader>pry Orequire 'pry'; binding.pry<Esc>

  " require byebug
  autocmd Filetype ruby nnoremap <buffer> <Leader>bye Orequire 'byebug'; byebug<Esc>

  " add benchmark ips
  autocmd Filetype ruby nnoremap <buffer> <Leader>bm iBenchmark.ips<Space>do<Space><Bar>x<Bar><CR>end<Esc>Ox.report("")<Space>do<Esc>oend<Esc>k^f"a<Esc>

  " add report block
  autocmd Filetype ruby inoremap <buffer> br' x.report("")<Space>do<Esc>oend<Esc>k^f"a

  " add factory block (FactoryGirl)
  autocmd Filetype ruby inoremap <buffer> fa' FactoryGirl.define<Space>do<CR>factory<Space>:<Space>do<CR>end<CR>end<Esc>2kf:a

  autocmd Filetype ruby nnoremap <buffer> <Leader>eq iActiveRecord::Base.connection.exec_query(<CR><<-SQL<CR><CR>SQL<CR>)<Esc>2kcc
  autocmd Filetype ruby nnoremap <buffer> <Leader>fbs A.find_by_sql(<CR><<-SQL<CR><CR>SQL<CR>)<Esc>2kcc
  autocmd Filetype ruby nnoremap <buffer> <Leader>sql o<<-SQL<CR><CR>SQL<Esc>ka
augroup end

augroup JSX
  autocmd!
  autocmd BufNewFile,BufRead *.jsx nnoremap <buffer> <Leader>cla AReact.createClass({<CR>render: function() {<CR>}<CR>});<Up><Up><Esc>o
augroup end

augroup Arduino
  autocmd!
  autocmd BufNewFile,BufRead *.ino,*.h,*.cpp nnoremap <buffer> <Leader>/ :call Comment("//")<CR>
  autocmd BufNewFile,BufRead *.ino,*.h,*.cpp nnoremap <buffer> <Leader>hg i#ifndef <CR>#define<CR>#include<CR>#endif<Up><Up><Up><Esc>A
  autocmd BufNewFile,BufRead *.ino,*.h,*.cpp nnoremap <buffer> <Leader>p ^v$yOstd::cout << "<Esc>pA" << std::endl;<Esc>^
  autocmd BufNewFile,BufRead *.ino,*.h,*.cpp nnoremap <buffer> <Leader>fo ifor(int i = 0; i < ; i++) {<CR>}<Esc>==<Up>2f;i
augroup end

augroup SQL
  autocmd!
  autocmd Filetype sql nnoremap <buffer> <Leader>q :call RunSqlFile('split')<CR>
  autocmd Filetype sql nnoremap <buffer> <Leader>j :call RunSqlFile('tab')<CR>
  autocmd Filetype sql nnoremap <buffer> <Leader>/ :call Comment("--")<CR>
  autocmd Filetype sql vnoremap <buffer> <Leader>/ :call Comment("--")<CR>
  autocmd Filetype sql nnoremap <buffer> <Leader>* i/*<CR>*/<Esc>O
  autocmd Filetype sql nnoremap <buffer> <Leader>tt :w<CR>:call VtrSendCommand('psql -d lingolive -f sql/playground/playground.sql')<CR>
  autocmd Filetype sql nnoremap <buffer> <Leader>daf :0,$d<CR>a
  autocmd Filetype sql nnoremap <buffer> <Leader>csv iCopy (select * from (<CR>)) to '' with csv header;<Esc>f(
augroup end

" Testing{{{

" rspec.vim mappings {{{
" let g:rspec_command = "call VtrSendCommand('spring rspec {spec}')"
" let g:rspec_command = "call VtrSendCommand('rspec {spec}')"
" call StartupSpringRSpec()
nnoremap <Leader>sr :call ToggleSpringRspec()<CR>
nnoremap <Leader>td :call RunRSpecDirOfCurrentBuffer()<CR>

nnoremap <Leader>tt :call RunCurrentSpecFile()<CR>
nnoremap <Leader>ts :call RunNearestSpec()<CR>
nnoremap <Leader>tl :call RunLastSpec()<CR>
nnoremap <Leader>ta :call RunAllSpecs()<CR>
" }}}

" Jasmine Coffee Spec Settings {{{
augroup JasmineCoffee
  autocmd!
  autocmd BufNewFile,BufRead *Spec.js.coffee,*spec.js.coffee inoremap <buffer> de' describe '', -><Esc>F'i
  autocmd BufNewFile,BufRead *Spec.js.coffee,*spec.js.coffee inoremap <buffer> it' it '', -><Esc>F'i
  autocmd BufNewFile,BufRead *Spec.js.coffee,*spec.js.coffee inoremap <buffer> be' beforeEach -><CR>
  autocmd BufNewFile,BufRead *Spec.js.coffee,*spec.js.coffee inoremap <buffer> ex' expect().toBe()<Esc>==f)i
augroup end
" }}}

" Javascript  Settings {{{
augroup Javascript
  autocmd!
"
  " jasmine content
  autocmd BufNewFile,BufRead *.js nnoremap <buffer> <Leader>db idebugger;<Esc>==
  autocmd BufNewFile,BufRead *.js inoremap <buffer> try' try {<CR>} catch(e) {<Enter>}<Up><Up><Esc>o
  autocmd BufNewFile,BufRead *.js nnoremap <buffer> <Leader>cl caWconsole.log(``);<Esc>2F`pa:<Space>${}<Esc>P==
  autocmd BufNewFile,BufRead *.js nnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *.js inoremap <buffer> if' if () {<CR>}<Esc>k2==f)i
  autocmd BufNewFile,BufRead *.js inoremap <buffer> ei' else if () {<CR>}<Esc>k2==f)i
  autocmd BufNewFile,BufRead *.js inoremap <buffer> fu' function<Space>() {<CR>}<Esc>k2==f(i
  autocmd BufNewFile,BufRead *.js nnoremap <buffer> <Leader>cla iclass  {<CR>constructor(x) {<CR>this.x = x;<CR>}<CR>};<Esc>?class<Enter>6==f{<Left>i

augroup end
" }}}
"
" Jasmine Javascript Spec Settings {{{
augroup JasmineJS
  autocmd!

  " jasmine content
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> jch' $('#jasmine_content').html()<Esc>==f(;a

  " describe block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> de' describe('', function() {<CR>});<Esc>k2==f'li

  " it block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> it' it('', function() {<CR>});<Esc>k2==f'li

  " beforeEach block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> be' beforeEach (function() {<CR>});<Esc>O

  " jasmine.createSpyObj() block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> jcso' jasmine.createSpyObj('', ['']);<Esc>==2f'i

  " jasmine.createSpy() block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> jcs' jasmine.createSpy('');<Esc>==2f'i

  " expect block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> ex' expect().toBe();<Esc>==f)i

  " expect().toHaveBeenCalled()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> exc' expect().toHaveBeenCalled();<Esc>==f)i

  " expect().not.toHaveBeenCalled()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> exnc' expect().not.toHaveBeenCalled();<Esc>==f)i

  " expect().toHaveBeenCalledWith()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> excw' expect().toHaveBeenCalledWith();<Esc>==f)i

  " expect().not.toHaveBeenCalledWith()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> exncw' expect().not.toHaveBeenCalledWith();<Esc>==f)i

  " spyOn()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> sp' spyOn()<Left>

  " and.callFake()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> acf' .and.callFake()<Left>
  "
  " and.returnValue()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> arv' .and.returnValue()<Left>

  " calls.argsFor()
  autocmd BufNewFile,BufRead *Spec.js,*spec.js inoremap <buffer> caf' .calls.argsFor()<Left>

  " Wrap selection with a describe block
  autocmd BufNewFile,BufRead *Spec.js,*spec.js vnoremap <buffer> <Leader>de <Esc>`>o});<Esc>`<Odescribe('<Esc>maa', function() {<Esc>gg=G'af'a

  autocmd BufNewFile,BufRead *Spec.js,*spec.js vnoremap <buffer> <Leader>it <Esc>`>o});<Esc>`<Oit('<Esc>maa', function() {<Esc>gg=G'af'a

  autocmd BufNewFile,BufRead *Spec.js,*spec.js nnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *Spec.js,*spec.js vnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  " extract the variable declarations right before the before block
  " You are inside the before block
  " Only moves the ones that start with var keyword

augroup end
" }}}

augroup SCAD
  autocmd!
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>us iuse <><Left>
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>cu icube([x,y,z]);<Esc>==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>cy icylinder(h=x, r=y);<Esc>==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>tr itranslate([x,y,z])<Space>{<CR><CR>}<Up><Up><Esc>3==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>sp isphere(x);<Esc>==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>co icolor([x,y,z])<Space><Esc>==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>di idifference()<Space>{<CR><CR>}<Up><Up><Esc>3==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>mo imodule w(q)<Space>{<CR><CR>}<Up><Up><Esc>3==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>sc iscale(h,h,h)<Space>{<CR><CR>}<Up><Up><Esc>3==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>in iintersection()<Space>{<CR><CR>}<Up><Up><Esc>3==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>/ :call Comment("//")<CR>
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>inf iintersection_for([x:y])<Space>{<CR><CR>}<Up><Up><Esc>3==
  autocmd BufNewFile,BufRead *.scad nnoremap <buffer> <Leader>ro irotate([x,y,z])<Esc>==
augroup end

" RSpec Insert shortcuts {{{
augroup RSpec
  autocmd!
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> de' describe "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> co' context "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> it'' it "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> sp' specify "" do<CR>end<Esc>k2==f"li
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> be' before(:each) {}<Esc>==f}i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> bed' before(:each) do<CR>end<Esc>O
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> ex' expect().to<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> exs' page.execute_script()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> evs' page.evaluate_script()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> exh' expect().to have_received()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> exhw' expect().to have_received().with()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> ex{' expect{}.to<Esc>==f}i

  " shortcut for let
  autocmd BufNewFile,BufRead *spec.rb nnoremap <buffer> le ilet(:)<Space>do<CR><CR>end<CR><Esc>3k3==^f:a
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> ar' allow().to receive()<Esc>==f)i
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> arr' allow().to receive().and_return()<Esc>==f)i

  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> arw' allow().to receive().with()<Esc>==f)i

  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> arwr' allow().to receive().with().and_return()<Esc>==f)i

  " double('') shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> dou' double("")<left><left>

  " instance_double('') shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> idou' instance_double("")<left><left>

  " class_double('') shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> cdou' class_double("")<left><left>
augroup end

  " create shortcut
  autocmd BufNewFile,BufRead *spec.rb inoremap <buffer> cr' create()<left>

  " convert expect().to have_received to allow().to receive
  autocmd BufNewFile,BufRead *spec.rb nnoremap <buffer> <Leader>ar /expect<CR>Ncwallow<Esc>/have_received<CR>cwreceive<Esc>

  " convert expect().to have_received to allow().to receive
  autocmd BufNewFile,BufRead *spec.rb nnoremap <buffer> <Leader>ex /allow<CR>Ncwexpect<Esc>/receive<CR>cwhave_received<Esc>

" }}}
" }}}

" Filetype Settings {{{

" Enable syntax highlighting when buffers were loaded through :bufdo, which
" disables the Syntax autocmd event to speed up processing.
augroup EnableSyntaxHighlighting
    " Filetype processing does happen, so we can detect a buffer initially
    " loaded during :bufdo through a set filetype, but missing b:current_syntax.
    " Also don't do this when the user explicitly turned off syntax highlighting
    " via :syntax off.
    " Note: Must allow nesting of autocmds so that the :syntax enable triggers
    " the ColorScheme event. Otherwise, some highlighting groups may not be
    " restored properly.
    autocmd! BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif

    " The above does not handle reloading via :bufdo edit!, because the
    " b:current_syntax variable is not cleared by that. During the :bufdo,
    " 'eventignore' contains "Syntax", so this can be used to detect this
    " situation when the file is re-read into the buffer. Due to the
    " 'eventignore', an immediate :syntax enable is ignored, but by clearing
    " b:current_syntax, the above handler will do this when the reloaded buffer
    " is displayed in a window again.
    autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
augroup END

"
augroup RNW_settings
  autocmd!
  autocmd BufNewFile,BufRead *.rnw nnoremap <buffer> <Leader>doc i\begin{document}<CR><CR>\end{document}<Up>
augroup end

" HTML file settings{{{
augroup HTML_file_settings
  autocmd!
  autocmd Filetype html nnoremap <buffer> <Leader>/ :call Comment("<!--", "-->")<CR>
  autocmd Filetype html vnoremap <buffer> <Leader>/ :call Comment("<!--", "-->")<CR>
augroup end
" }}}


" CoffeeScript file settings {{{
augroup Coffeescript_file_settings
  autocmd!
  " jQuery object shortcuts
  autocmd Filetype coffee inoremap <buffer> $( $('')<Left><Left>
  " Commenting
  autocmd Filetype coffee nnoremap <buffer> <Leader>/ :call Comment("#")<CR>
  autocmd Filetype coffee vnoremap <buffer> <Leader>/ :call Comment("#")<CR>
augroup end
"}}}

" Javascript ERB Filetype settings {{{
augroup JavaScriptERB
  autocmd!
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *.js.erb  vnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> fu' function() {<CR>}<Esc>k2==f)i
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> wh' while() {<CR>}<Esc>k2==f)i
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> fo' for(var i = 0; i < ; i++) {<CR>}<Esc>k2==f;;i
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> def' define([''], function() {<CR>return {<CR>}<CR>});<Esc>3kf'a
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> if' if () {<CR>}<Esc>k2==f)i

  " return
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> ret' return<Space>

  " else-if
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> ei' else if () {<CR>}<Esc>k2==f)i

  " switch statement
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> sw' switch () {<CR>}<Esc>k2==f)i

  " case statement
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> ca' case :<CR>break;<Up><Esc>f:i

  " Add a semicolon to the end in-place
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> <Leader>; <Esc>mag_a;<Esc>`aa

  " add semicolon to the end of the line
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>; mag_a;<Esc>`a

  " create a var function of the word
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>vf viwyivar <Esc>g_a = function <Esc>pa() {<CR>}<Esc>kf(a

  " copy the variable, add a colon to the end of it, write the function
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>:f viwyea: function <Esc>pa() {<CR>}<Up><Esc>f(a

  " create a prototyped instance method
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>pf viW"syma/function [A-Z]<CR>w"ayiw`a"aPa.prototype.<Esc>A = function <Esc>"spa(){<CR>}<Esc>kf(a

  " console.log the variable underneath the cursor, plus put the name in a string
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>clv viWyEa); <Esc>`<iconsole.log(': ' + <Esc>F:hp

  " console.log the line
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>cl v^og_yg_a); <Esc>`<iconsole.log(<Esc>
  " jQuery object shortcuts {{{
  autocmd BufNewFile,BufRead *.js.erb  inoremap <buffer> $( $('')<Left><Left>

  " Wrap selection with a jQuery object
  autocmd BufNewFile,BufRead *.js.erb  vnoremap <buffer> <Leader>$( <Esc>`>a')<Esc>`<i$('<Esc>

  " Wrap around word with a jQuery object
  autocmd BufNewFile,BufRead *.js.erb  nnoremap <buffer> <Leader>$( viW<Esc>Bi$('<Esc>Ea')<Esc>
  " }}}

augroup end
" }}}

augroup TodoFile
  autocmd!
  autocmd BufNewFile,BufRead *todo.markdown nnoremap <buffer> <Leader>x :call ToggleMark()<CR>
augroup end

" Markdown filetype settings {{{
augroup Markdown
  autocmd!

  " inside header
  autocmd Filetype markdown onoremap <buffer> ih :<C-u>execute "normal! ?^==\\+$\\|--\\+$\r:nohlsearch\rkvg_"<CR>

  " around header
  autocmd Filetype markdown onoremap <buffer> ah :<C-u>execute "normal! ?^==\\+$\\|--\\+$\r:nohlsearch\rg_vk0"<CR>

  " inside last email
  autocmd Filetype markdown onoremap <buffer> il@ :<C-u>execute "normal! ?\\S\\+@\\S\\+\\.\\S\\+\rvE"<CR>

  " inside next email
  autocmd Filetype markdown onoremap <buffer> in@ :<C-u>execute "normal! /\\S\\+@\\S\\+\\.\\S\\+\rvE"<CR>

  " wrap block with fold markers
  autocmd Filetype markdown nnoremap <Leader>fap vap<Esc>`<ki {{{<Esc>`>a" }}}<Esc>'<kf{

  " wrap block of text with three tilde pairs
  autocmd Filetype markdown nnoremap <buffer> <Leader>tab v}o{<Esc>i```<Esc>`>a```

  " insert shortcut for three tildes
  autocmd Filetype markdown inoremap <buffer> <Leader>`` ```<CR><CR>```<Esc><Up>

  " wrap visually-selected lines with three pairs of tildes
  autocmd Filetype markdown nnoremap <buffer> <Leader>3` <Esc>ma`>o```<Esc>`<O```<Esc>`a

  " add a dash string of the same length as the header right above it
  autocmd Filetype markdown nnoremap <buffer> <Leader>- :call AddCharStringAsLongAsHeaderString("-")<CR>

  " add a equals string of the same length as the header right above it
  autocmd Filetype markdown nnoremap <buffer> <Leader>= :call AddCharStringAsLongAsHeaderString("=")<CR>

  " HTML escaped single quote
  autocmd Filetype markdown inoremap <buffer> <Leader>e' &#39;

  " HTML escaped double quote
  autocmd Filetype markdown inoremap <buffer> <Leader>e" &quot;

  " highlight section
  autocmd Filetype markdown inoremap <buffer> hl' {% highlight  linenos %}<CR>{% endhighlight %}<Esc><Up>^2e<Right>a

  " timestamp
  autocmd Filetype markdown inoremap <buffer> da' <Esc>:read !date<Cr><Up>J

  " MathJax Inline
  autocmd Filetype markdown inoremap <buffer> <Leader>mi' \\(\\)<Left><Left><Left>

  " MathJax Equation
  autocmd Filetype markdown nnoremap <buffer> <Leader>$ a$$<CR><CR>$$<Up>

  " MathJax Equation
  autocmd Filetype markdown nnoremap <buffer> <Leader>be a\begin{equation}<CR>\begin{aligned}<CR>\end{aligned}<CR>\end{equation}<Esc>kO

  " Text
  autocmd Filetype markdown nnoremap <buffer> <Leader>t a\text{}<Left>

  " Add new space inside equation
  autocmd Filetype markdown nnoremap <buffer> <Leader>\ A\\


  " begin equation
  autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <Leader>be a\begin{equation}<CR>\begin{aligned}<CR>\end{aligned}<CR>\end{equation}<Esc>kO

  " MathJax align
  autocmd Filetype markdown nnoremap <buffer> <Leader>ba \begin{align}<CR><CR>\end{align}<Up>

  " MathJax Fraction
  autocmd Filetype markdown inoremap <buffer> <Leader>mf' \frac{}{}<Esc>F}i

  autocmd Filetype markdown setlocal foldmethod=marker
  autocmd Filetype markdown setlocal foldlevelstart=0
augroup end
" }}}

" Objective-C Filetype settings {{{
augroup ObjectiveC
  autocmd!
  autocmd BufNewFile,BufRead *.h  nnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *.m  nnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
augroup end
" }}}

augroup Vue
  autocmd!
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>tm i<template><CR></template><CR><CR><script><CR>export default {<CR><Space><Space>name: '',<CR>  components: {<CR>  },<CR><Space><Space>data() {<CR>    return {}<CR>  },<CR>  props: {<CR>  },<CR>  computed: {<CR><CR>  }, methods: {<CR>  }<CR><CR>}<CR></script><CR><CR><style scoped><CR></style><Esc>
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>db Odebugger<Esc>
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *.vue vnoremap <buffer> <Leader>/ :call Comment("\/\/")<CR>
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> fu' function() {<CR>}<Esc>k2==f)i
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> wh' while() {<CR>}<Esc>k2==f)i
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> fo' for(var i = 0; i < ; i++) {<CR>}<Esc>k2==f;;i
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> def' define([''], function() {<CR>return {<CR>}<CR>});<Esc>3kf'a
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> if' if () {<CR>}<Esc>k2==f)i

  " return
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> ret' return<Space>

  " else-if
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> ei' else if () {<CR>}<Esc>k2==f)i

  " switch statement
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> sw' switch () {<CR>}<Esc>k2==f)i

  " case statement
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> ca' case :<CR>break;<Up><Esc>f:i

  " Add a semicolon to the end in-place
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> <Leader>; <Esc>mag_a;<Esc>`aa

  " add semicolon to the end of the line
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>; mag_a;<Esc>`a

  " create a var function of the word
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>vf viwyivar <Esc>g_a = function <Esc>pa() {<CR>}<Esc>kf(a

  " copy the variable, add a colon to the end of it, write the function
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>:f viwyea: function <Esc>pa() {<CR>}<Up><Esc>f(a

  " create a prototyped instance method
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>pf viW"syma/function [A-Z]<CR>w"ayiw`a"aPa.prototype.<Esc>A = function <Esc>"spa(){<CR>}<Esc>kf(a

  " console.log the variable underneath the cursor, plus put the name in a string
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>clv viWyEa); <Esc>`<iconsole.log(': ' + <Esc>F:hp

  " console.log the line
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>cl v^og_yg_a); <Esc>`<iconsole.log(<Esc>a"<Esc>pa", <Esc>

  " Block commenting
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>b/ :call JavaScriptBlockComment()<CR>

  " alert the line
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>al v^og_yg_a); <Esc>`<ialert(<Esc>
  " jQuery object shortcuts {{{
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> $( $('')<Left><Left>

  " Wrap selection with a jQuery object
  autocmd BufNewFile,BufRead *.vue vnoremap <buffer> <Leader>$( <Esc>`>a')<Esc>`<i$('<Esc>

  " Wrap around word with a jQuery object
  autocmd BufNewFile,BufRead *.vue nnoremap <buffer> <Leader>$( viW<Esc>Bi$('<Esc>Ea')<Esc>

  " Try/Catch
  autocmd BufNewFile,BufRead *.vue inoremap <buffer> try' try {<CR>} catch(e) {<Enter>}<Up><Up><Esc>o
  " }}}

augroup end

function! RunBlack()
  if executable('black')
    silent !black %
    if v:shell_error
      echo "Black formatting failed"
    endif
  else
    echo "Black not found. Install with: pip install black"
  endif
endfunction

" Python Filetype settings {{{
augroup Python
  autocmd!
" Run Black on Python files when saving (with error handling)
  autocmd BufWritePost *.py call RunBlack()
  autocmd Filetype python nnoremap <buffer> <Leader>lp O@line_profiler.profile<Esc>
  autocmd Filetype python nnoremap <buffer> <Leader>db Oimport pdb; pdb.set_trace()<Esc>
  autocmd Filetype python nnoremap <buffer> <Leader>ddb :call Delete("import pdb; pdb.set_trace()")<CR>
  autocmd Filetype python nnoremap <buffer> <Leader>tdb :call Toggle("import pdb; pdb.set_trace()")<CR>

  " Add multi-line double-quote string literal
  autocmd Filetype python nnoremap <buffer> <Leader>ml" o"""<CR><CR>"""<Up><Esc>A
  " Add multi-line single-quote string literal
  autocmd Filetype python nnoremap <buffer> <Leader>ml' o'''<CR><CR>'''<Up><Esc>A

  autocmd Filetype python vnoremap <buffer> <Leader>tr ctry:<CR>except Exception as e:<CR>import pdb; pdb.set_trace()<Esc><Up>PV/except<CR><Up>=/except<CR>2==
  autocmd Filetype python nnoremap <buffer> <Leader>dt V/except<CR><Up>o<Down><?try<CR>dd/except<CR>2dd
  autocmd Filetype python nnoremap <buffer> <Leader>p ^c$print "<Esc>p$a"<Esc>oprint <Esc>poprint "\n"<CR>

  autocmd Filetype python setlocal tabstop=8 expandtab softtabstop=4 shiftwidth=4

  " Run specter
  autocmd Filetype python nnoremap <buffer> <Leader>tt :call VtrSendCommand('specter')<CR>

  " create a class
  autocmd Filetype python inoremap <buffer> cl' class ():<CR>def __init__(self):<Up><Esc>$F(i

  " define a method
  autocmd Filetype python inoremap <buffer> def' def (self):<Esc>F(i

  " if-statement
  autocmd Filetype python inoremap <buffer> if' if<Space>:<Left>

  " try-except
  autocmd Filetype python inoremap <buffer> tr' try<Space>:<CR>except<Space>Exception as e:<Esc>O
augroup end

augroup PyTest
  autocmd!
  autocmd BufNewFile,BufRead *test*.py nnoremap <buffer> <Leader>fo O@pytest.mark.f<Esc>
augroup end

augroup Mamba
  autocmd!
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>ass iassert<Space>
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>des iwith<Space>description(''):<Esc>F'i
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>con iwith<Space>context(''):<Esc>F'i
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>it iwith<Space>it(''):<Esc>F'i
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>bee iwith<Space>before.each:<CR>
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>bea iwith<Space>before.all:<CR>
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>ae iwith<Space>after.each:<CR>
  autocmd BufNewFile,BufRead *spec.py nnoremap <buffer> <Leader>aa iwith<Space>after.all:<CR>
augroup end

" tmux {{{
Bundle 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-m> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1
"}}}

" christoomey/vim-tmux-runner'{{{

Bundle 'christoomey/vim-tmux-runner'

nnoremap <Leader>vv :call VtrSendVisuallySelectedCommand()<CR>
vnoremap <Leader>vv :call VtrSendVisuallySelectedCommand()<CR>
vnoremap <Leader>vr :VtrSendLinesToRunner<CR>
nnoremap <Leader>vr :VtrSendLinesToRunner<CR>
nnoremap <Leader>vsc :VtrSendCommandToRunner<CR>
nnoremap <Leader>vcr :VtrClearRunner<CR>
nnoremap <Leader>vfc :VtrFlushCommand<CR>
nnoremap <Leader>vatp :VtrAttachToPane<CR>
nnoremap <Leader>vsf :VtrSendFile<CR>
nnoremap <Leader>vfr :VtrFocusRunner<CR>
nnoremap <Leader>vpry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<CR>
nnoremap <Leader>vpn :VtrSendCommand next<CR>
nnoremap <Leader>vps :VtrSendCommand step<CR>
" show the backtrace
nnoremap <Leader>vpt :VtrSendCommand caller.reject{\|call\| call.match "versions"}<CR>
nnoremap <Leader>vpw :VtrSendCommand whereami<CR>
nnoremap <Leader>vpfi :VtrSendCommand finish<CR>
nnoremap <Leader>vpfr :VtrSendCommand frame<CR>
nnoremap <Leader>vpvd :VtrSendCommand d<CR>
nnoremap <Leader>vpvu :VtrSendCommand u<CR>
nnoremap <Leader>vpq :VtrSendCommand q<CR>
nnoremap <Leader>vpe :VtrSendCommand exit!<CR>
nnoremap <Leader>vpbk :VtrSendCommand break<CR>
nnoremap <Leader>vpbda :VtrSendCommand break --disable-all<CR>
nnoremap <Leader>vpu :VtrSendCommand up<CR>
nnoremap <Leader>vpd :VtrSendCommand down<CR>
nnoremap <Leader>vpc :VtrSendCommand continue<CR>
"}}}
" }}}
