set encoding=utf-8
scriptencoding utf-8

"----------------------------------------------------------
" クリップボードからのペースト
"----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"---------------------------------------
"キーバインド設定
"----------------------------------------
" ノーマルモードに移行
inoremap jj <Esc>
" 

" 行番号表示
set number
highlight LineNr ctermfg=black ctermbg=none
"カーソルの色変更
"highlight Cursor guifg=white guibg=red
highlight Cursor ctermfg=white ctermbg=red
"hi default Normal ctermfg=red ctermbg=red
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
set background=light
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=None
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
"set clipboard=unnamed,autoselect
" オートインデント
set autoindent
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a
" CRLFに改行コードを変更
set fileformat=unix
" インデントがスマートになる（らしい）
set smartindent
" 全角文字をちゃんと表示する
set ambiwidth=double
" 折り返したときにインデントする
set breakindent
" 折り返したときの追加のインデントの深さを指定する
set breakindentopt=shift:0

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
"----------------------------------------
" プラグインを追加
"----------------------------------------
"neovim特有の設定"
set shellcmdflag=-c

call plug#begin('~/.vim/plugged')

" NERDTree プラグイン
Plug 'preservim/nerdtree'

" coc.nvim プラグイン
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python プラグイン
Plug 'python-mode/python-mode', { 'for': 'python' }

" Goプラグイン
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ヘルプ日本語化
Plug 'vim-jp/vimdoc-ja'

Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

"----------------------------------------
" コマンドマッピング
"----------------------------------------
command! Pi PlugInstall
command! Pu PlugUpdate
command! Pc PlugClean
command! Tr terminal
command! Nt NERDTree
command! Re source $MYVIMRC
nnoremap dx dd
nnoremap dd "_dd
tnoremap <C-j> <C-\><C-n>
cnoreabbrev he help
nnoremap <F2> <C-v>
vnoremap <F2> <C-v>
command! W call s:RunCurrentFile()

" 編集中ファイル保存＆実行コマンド
function! s:RunCurrentFile()
    " Save the current file
    write

    " Get Path
    let pwd = expand('!pwd')

    " Get the current file extension
    let l:filetype = expand('%:e')

    " run the appropriate command based on the file extension
    if l:filetype == 'py'
        !python %
    elseif l:filetype == 'go'
        !go run %
    elseif l:filetype == 'sh'
        !bash %
    else
        echo "No run command for this file type."
    endif
endfunction
"---------------------------------------
" カラースキーム　　
"---------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

" インデントが最初からカラーリング
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=3   ctermbg=224
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=214 ctermbg=223
let g:indent_guides_enable_on_vim_startup = 1

" 行番号表示
set number
highlight LineNr ctermfg=34 ctermbg=240
"カーソルの色変更
"highlight Cursor guifg=white guibg=red
highlight Cursor ctermfg=white ctermbg=red
set cursorline
highlight CursorLine cterm=NONE ctermbg=white ctermfg=NONE gui=NONE guibg=lightgrey guifg=NONE

" 初期状態はcursorlineを表示しない
" 以下の一行は必ずcolorschemeの設定後に追加すること
"#hi clear CursorLine
"
"" 'cursorline' を必要な時にだけ有効にする
"" http://d.hatena.ne.jp/thinca/20090530/1243615055
"" を少し改造、number の highlight は常に有効にする
"#augroup vimrc-auto-cursorline
"#  autocmd!
"#  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
"#  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
"#  autocmd WinEnter * call s:auto_cursorline('WinEnter')
"#  autocmd WinLeave * call s:auto_cursorline('WinLeave')
"#
"#  setlocal cursorline
"#  hi clear CursorLine
"#
"#  let s:cursorline_lock = 0
"#  function! s:auto_cursorline(event)
"#    if a:event ==# 'WinEnter'
"#      setlocal cursorline
"#      hi CursorLine term=underline cterm=underline guibg=Grey90 " ADD
"#      let s:cursorline_lock = 2
"#    elseif a:event ==# 'WinLeave'
"#      setlocal nocursorline
"#      hi clear CursorLine " ADD
"#    elseif a:event ==# 'CursorMoved'
"#      if s:cursorline_lock
"#        if 1 < s:cursorline_lock
"#          let s:cursorline_lock = 1
"#        else
"#          " setlocal nocursorline
"#          hi clear CursorLine " ADD
"#          let s:cursorline_lock = 0
"#        endif
"#      endif
"#    elseif a:event ==# 'CursorHold'
"#      " setlocal cursorline
"#      hi CursorLine term=underline cterm=underline guibg=Grey90 " ADD
"#      let s:cursorline_lock = 1
"#    endif
"#  endfunction
"#augroup END

hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=240
" 列を強調表示
set cursorcolumn
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=blue
match ZenkakuSpace /　/

set hlsearch
highlight Search ctermfg=NONE ctermbg=215 cterm=NONE guifg=NONE guibg=#FFA500
autocmd CursorMoved * if &hlsearch | silent! execute 'nohlsearch' | let @/ = '\<' . expand('<cword>') . '\>' | set hlsearch | endif


autocmd VimEnter * NERDTree | wincmd l
