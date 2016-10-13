set ignorecase 
set wildmenu
set wildmode=list,full
set nocompatible               " be iMproved
set backspace=2
filetype off

if exists("cscope.out")
   cs add csope.out
elseif $CSCOPE_DB  != ""
   cs add $CSCOPE_DB
endif

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=~/Downloads/fzf
call vundle#rc()
    " github repos
    Bundle 'gmarik/vundle'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'scrooloose/syntastic'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'octol/vim-cpp-enhanced-highlight'
    Bundle 'scrooloose/nerdtree'
    Bundle 'majutsushi/tagbar'
    Bundle 'bling/vim-airline'
    " Bundle 'fholgado/minibufexpl.vim'
    Bundle 'jiangmiao/auto-pairs'

    " vim repos
    Bundle 'taglist.vim'

filetype plugin indent on
set tabstop=4
set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4
set showmatch
set laststatus=2
set hidden
set cindent
set cmdheight=2
set so=7
set number
let mapleader = ","
"let g:winManagerWindowLayout='TagList'
"nmap wm :WMToggle<cr>
nmap <F8> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :make<CR>
nmap bn :bn<CR>
nmap bp :bp<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<cr>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<cr>
"let g:miniBufExplMapWindowNavVim = 1
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:airline#extensions#tabline#enabled = 1
set completeopt=longest,menu
let&termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
au BufNewFile,BufRead *.md setfiletype markdown
au BufNewFile,BufRead *.scm :set kp:csi
syntax enable
set background=dark
"colorscheme solarized
set t_Co=256

set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf_for_C/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2    "从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1   " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>   "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
