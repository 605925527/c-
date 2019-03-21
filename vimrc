set autochdir
set tags+=tags;
set nocompatible    " be iMproved

filetype off        " required!
	set rtp+=/home/liuhaijiao/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'Lokaltog/vim-powerline'
Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'aceofall/gtags.vim'
Bundle 'vimwiki'
Bundle 'SuperTab'
Bundle 'bufexplorer.zip'
Bundle 'a.vim'
Bundle 'slimv.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'AutoComplPop'
Bundle 'OmniCppComplete'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'FencView.vim'
Bundle 'VimRepress'

let g:slimv_leader = ",l"			"slimv leader
let g:paredit_mode = 0				"disable paredit mode
let mapleader = ","					"leader is ,	
filetype indent plugin on			"filetype detection

set fileencodings=utf-8,gb18030,gbk,gb2312,cp936
set number							"show line number
set backspace=indent,eol,start		"powerful backspace
set nobackup						"don't keep a backup file
set history=1000					"keep 1000 lines of command line history
set ruler							"show the cursor position all the time
set showcmd							"display incomplete commands
set incsearch						"do incremental searching
set hlsearch						"highlight search result
set autoread						"auto update
set showmatch						"show match bracket 
set iskeyword=a-z,A-Z,48-57,_		"C style keyword
set wildmode=list:full				"completion mode
set wildmenu
set vb t_vb=						"no bell
set laststatus=2
" "set mouse =a
syntax on							"enable syntax

set tw=80
set fo+=m

"color  
set t_Co=256						"256 color

"TAB 
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab

if has("autocmd")
    autocmd FileType cpp,python setlocal ts=4 sts=4 sw=4 expandtab		"python style
    autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab		"kernel style
endif

"设置括号自动补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

"indent 
set smartindent
set autoindent
set cindent

"cscope
if has("cscope")
" set csprg=cscope
" set csto=0
" set cst
" set nocsverb
" " add any database in current directory
" if filereadable("cscope.out")
"     cs add cscope.out
" " else add database pointed to by environment
" elseif $CSCOPE_DB != ""
"     cs add $CSCOPE_DB
" endif
" set csverb
" 
endif

function Toggle_cscopequickfix (arg)
    if a:arg == 1
        set cscopequickfix=g-,c-,s-,t-,e-,f-,i-,d-
        cwin
    else
        set cscopequickfix=
        cclose
    endif
endfunction

command! -nargs=0 CscopeQuickfixEnable call Toggle_cscopequickfix("1")
command! -nargs=0 CscopeQuickfixDisable call Toggle_cscopequickfix("0")


"查找本 C 符号(可以跳过注释)
nmap<leader>ss :cs find s<C-R>=expand("<cword>")<cr><cr>
"查找本定义
nmap<leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
" 找到调用这个函数的函数
nmap<leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
"查找本字符串
nmap<leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
" egrep 
nmap<leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
" 查找本文件
nmap<leader>sf :cs find f<C-R>=expand("<cfile>")<cr><cr>

nmap<leader>si :cs find i<C-R>=expand("<cfile>")<cr><cr>
" 查找本函数调用的函数
nmap<leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>


"let VIMPRESS = [{'username':'wenpincui',
"                \'password':'108210110',
"                \'blog_url':'http://lhj.com/'
"                \},]
"
"

" OmniCppComplete
set completeopt=menu,longest,menuone
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteDot = 1   
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DisplayMode=1

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


"Taglist
" let Tlist_Show_One_File = 1			"show only one file's tag
let Tlist_Exit_OnlyWindow = 1		"exit vim if only taglist window is open
" nmap <leader>tl :Tlist<CR>

"Gtags
"nmap <F2> :Gtags -gi<cr><cr>
"nmap <A-e> :Gtags -gi<cr><cr><cr>*.[ch]<cr>
"map <C-[> :Gtags<cr><cr>
"map <C-r> :Gtags -r<cr><cr>

"sdcv
nmap <leader>k :!sdcv <C-R>=expand("<cword>")<CR>

"lookupfile
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0

if filereadable("./filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr = '"./filenametags"'
else
""    let g:LookupFile_TagExpr = '"/home/liuhaijiao/code/dipingxian/platform/vc0718/kernel/filenametags"'
endif

nmap<leader>lk :LookupFile<cr>
"nmap <silent> <leader>lk <Plug>LookupFile<cr>
nmap <silent> <leader>lb :LUBufs<CR>
nmap <silent> <leader>lw :LUWalk<CR>

"NERDTree plugin
"let NERDTreeWinSize = 31 "size of the NERD tree
"nnoremap <leader>nd :NERDTreeToggle<CR><CR>
"
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="rigth"
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open a NERDTree
map <F7> :NERDTreeToggle<cr>
" t in new table open a file
" O open file tree
" X close file tree
let NERDTreeWinPos="rigth"

"vimwiki
"let g:vimwiki_list = [{'path': '~/Vimwiki/',
"\ 'path_html': '~/Vimwiki/html/',
"\ 'html_header': '~/Vimwiki/template/header.tpl',}]

"type command to flash image is boring
"nmap <leader>f :!fastboot.sh<CR><CR>

"opening taglist
map <silent> <F8> :TlistToggle<cr> 
let Tlist_Auto_Open=1
let Tlist_Auto_Update=1
let Tlist_Use_Right_Window=1
colorscheme darkblue
colorscheme blue                "theme
colorscheme evening                "theme
colorscheme peachpuff

set cursorline 
hi Search term=standout ctermfg=0 ctermbg=1

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




