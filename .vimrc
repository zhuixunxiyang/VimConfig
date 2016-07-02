
" common configurations for VIM editor.
" display line number
set nu

" set auto indent 
set autoindent
" set width of a tab-space to 4
set tabstop=4
set shiftwidth=4

" enable highlighting on matched items for a search
set hls
" ignore case when search
set ignorecase
" enable increasing search
set incsearch

" disable mouse, set to 'a' to enable mouse
set mouse=

" enable filetype detection and auto indent
filetype on
filetype plugin on
filetype indent on

" jump to the last position when open a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif

" Switch syntax highlighting on, when the terminal has colors
if has("syntax")
    syntax enable
    syntax on
endif

" set file encodings
set fileencodings=cp936
set fileencoding=cp936

" press C-<F5> to refresh tags
map c<F5> :!ctags -f .ctags -R --c++-kinds=+p --fields=+ialS --extra=+q .<CR><CR> :TlistUpdate<CR>

" ====================== Omni Complete ==================
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1 " .
let OmniCpp_MayCompleteArrow=1 " ->
let OmniCpp_MayCompleteScope=1 " ::
let OmniCpp_NamespaceSearch=1 " namespace
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1 " display function prototype
let OmniCpp_SelectFirstItem=2 " auto select the first candidate 

" tell OmniCppComplete where to load ctags files
set tags=.ctags
set tags+=./.ctags " load tags file under current directory
set tags+=/usr/include/c++/5/.ctags
set tags+=/usr/include/c++/5.3.1/.ctags

" set keys for echofunc
" g:EchoFuncKeyNext
" g:EchoFuncKeyPrev

" ====================== NERD Tree ======================
let g:NERDTree_title="[NERDTree]"
let g:NERDTreeIgnore=['\~$', '.swp$', '.pyc$', '.o$', '.obj$', '.out$']
let g:NERDTreeWinPos="left"

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

" ====================== Taglist ========================
let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=1 " put taglist window on the right
let Tlist_Show_One_File=1 " do not show multiple taglists
let Tlist_File_Fold_Auto_Close=1 " close taglists for non-current files
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1 " update in real time
let Tlist_Inc_Winwidth=0

" ====================== WinManager =====================
map wm :WMToggle<CR>
let g:winManagerWindowLayout='NERDTree|TagList'
let g:persistentBehaviour=0 " exit VIM after all files being closed
let g:winManagerWidth = 30

" ====================== SuperTab =======================
let g:SuperTabDefaultCompletionType="context"

" ====================== MiniBuf ========================
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplMoreThanOne=0

" auto load doc files
:helptags ~/.vim/doc/
