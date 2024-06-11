""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set nocompatible                  " be iMproved, required
set pyxversion=3
filetype on                     " required
" set the runtime path to include Vundle and initialize
set rtp+=/home/Tuo/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Bundle 'taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'fholgado/minibufexpl.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'wesleyche/SrcExpl'
Bundle 'scrooloose/nerdcommenter'

if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

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
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =0             "在左侧窗口中显示taglist窗口
nnoremap <F4> :TlistToggle<CR> "设置快捷键
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
" set expandtab
set autoindent
set hlsearch
"set tag=/home/chen/Documents/kernel/linux-source-4.15.0/tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" miniBufExpl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne = 0

map <F7> :MBEbp<CR>
map <F8> :MBEbn<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
"let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
"let g:ycm_auto_trigger=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog = "/usr/bin/python3"
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SourceExplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" // The switch of the Source Explorer
nmap <C-F12> :SrcExplToggle<CR>                "打开/闭浏览窗口
let g:SrcExpl_winHeight = 7
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_colorSchemeList = [
        \ "Red",
        \ "Cyan",
        \ "Green",
        \ "Yellow",
        \ "Magenta"
    \ ]
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"let g:SrcExpl_updateTagsKey = "<C-F12>"
let g:SrcExpl_prevDefKey = "<C-F10>"
let g:SrcExpl_nextDefKey = "<C-F11>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope 自动加载cscope.out文件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out",".;")
        let cscope_pre=matchstr(cscope_file,".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            set nocsverb
            set cspc=8
            exe "cs add" cscope_file cscope_pre
            set csverb
        endif
    endif
endif

