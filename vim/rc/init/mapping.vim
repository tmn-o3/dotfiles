
" basic mapping"{{{
nnoremap <silent> <Leader>x :<C-u>call tmno3#vimrc#switch_char()<CR>
nnoremap x "_x

nnoremap <Space>gi gi

nnoremap <silent> <Space>n :<C-u>nohlsearch<CR>

nnoremap <Space>. @:
vnoremap <Space>. @:

nnoremap <silent> <F5> :<C-u>source $MYVIMRC<CR>:source $MYGVIMRC<CR>:nohlsearch<CR>

nnoremap <Leader>r <C-r>
noremap <Leader>t t

nnoremap R r
vnoremap R r

nnoremap Q q:

nnoremap sh gU
nnoremap sl gu
vnoremap sh gU
vnoremap sl gu
"}}}

" kana mapping"{{{
nnoremap い i
nnoremap あ a
nnoremap <silent> ｊ :<C-u>set iminsert=0<CR>
"}}}

" file mapping"{{{
nnoremap [file] <Nop>
nmap <Space>f [file]
nnoremap [file]w :<C-u>w<CR>
nnoremap [file]r :<C-u>file<Space>
"}}}

" buffer mapping"{{{
nnoremap [buf] <Nop>
nmap <Space>b [buf]
nnoremap [buf]b <C-^>
nnoremap [buf]n :<C-u>call <SID>new_buf()<CR>
function! s:new_buf() abort
    enew | setlocal buftype=nofile noswapfile
endfunction
nnoremap [buf]Q :<C-u>qa<CR>
"}}}

" swap :; mapping"{{{
nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;
"}}}

" into visual mode mapping"{{{
nnoremap [visual] <Nop>
nmap v [visual]
vnoremap [visual] <Nop>
vmap v [visual]
nnoremap [visual]h gv
nnoremap [visual]n n
nnoremap [visual]l <S-v>
nnoremap [visual]c <C-v>
vnoremap [visual]l <S-v>
vnoremap [visual]c <C-v>
vnoremap [visual]n v

" depends yankround
function! s:select_paste_region() abort
    call setpos("'<", [0, line("'["), col("'[")])
    call setpos("'>", [0, line("']"), col("']")])
    normal! gv
endfunction
nnoremap [visual]p :<C-u>call <SID>select_paste_region()<CR>
"}}}

" select mode mapping"{{{
snoremap <CR> <DEL>
"}}}

" grep mapping"{{{
nnoremap <Space>Gd :<C-u>vimgrep //j *<Left><Left><Left><Left>
nnoremap <Space>Gr :<C-u>grep! "" *<Left><Left><Left>
nnoremap <Space>Gt :<C-u>cexpr ""<CR>:tabdo vimgrepadd //j %<Left><Left><Left><Left>
nnoremap <Space>Gb :<C-u>cexpr ""<CR>:bufdo vimgrepadd //j %<Left><Left><Left><Left>
"}}}

" ESC mapping"{{{
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> ｊｊ <ESC>
cnoremap <silent> jj <C-c>
onoremap jj <ESC>
vnoremap v <ESC>
snoremap jj <ESC>
"}}}

" indent mapping"{{{
nnoremap [indent] <Nop>
nmap <Space>i [indent]
vnoremap [indent] <Nop>
vmap <Space>i [indent]

nnoremap [indent]i >>
nnoremap [indent]d <<
nnoremap [indent]t V:retab<CR>

vnoremap [indent]i >
vnoremap [indent]d <
vnoremap [indent]t :retab<CR>
vnoremap [indent]s =
"}}}

" move mapping"{{{
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj

noremap ge $
noremap ga ^
noremap gh 0
noremap gz G

nnoremap go <C-o>
nnoremap gi <C-i>

nnoremap gO g;
nnoremap gI g,

nnoremap <C-i> <C-i>
nnoremap <C-o> <C-o>

vnoremap <S-j> }
vnoremap <S-k> {
vnoremap <S-l> %
nnoremap <silent> <S-l> :<C-u>keepjumps normal %<CR>
nnoremap <silent> <S-j> :<C-u>keepjumps normal }<CR>
nnoremap <silent> <S-k> :<C-u>keepjumps normal {<CR>

nnoremap <C-k> <C-b>
nnoremap <C-j> <C-f>
"}}}

" newline mapping"{{{
nnoremap [newline] <Nop>
nmap o [newline]
nnoremap <silent> [newline]o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent> [newline]j :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| execute "normal j" \| endfor<CR>
nnoremap <silent> [newline]k :<C-u>for i in range(v:count1) \| call append(line('.') - 1, '') \| endfor<CR>
nnoremap [newline]d o
nnoremap [newline]u O
"}}}

" encode and format mapping"{{{
nnoremap [option] <Nop>
nmap <Space>o [option]

nnoremap [option]u :<C-u>set fileencoding=utf8<CR>
nnoremap [option]e :<C-u>set fileencoding=euc-jp<CR>
nnoremap [option]s :<C-u>set fileencoding=shift_jis<CR>
nnoremap [option]fd :<C-u>set fileformat=dos<CR>
nnoremap [option]fm :<C-u>set fileformat=mac<CR>
nnoremap [option]fu :<C-u>set fileformat=unix<CR>

nnoremap <silent> [option]n :<C-u>noh<CR>
"}}}

" keyword mapping"{{{
function! s:tab_tag_open() abort
    try
        execute "tag ". expand("<cword>")
        tab sp
        tabprevious
        normal! <C-o>
        tabnext
    catch
        echo "Not found tag"
    endtry
endfunction
nnoremap [keyword]t :<C-u>call <SID>tab_tag_open()<CR>

function! s:vertical_tag_open() abort
    try
        execute "tag ". expand("<cword>")
        vsplit
        normal! <C-o>
    catch
        echo "Not found tag"
    endtry
endfunction
nnoremap [keyword]v :<C-u>call <SID>vertical_tag_open()<CR>
nnoremap [keyword]o <C-]>
nnoremap [keyword]h <C-w>]
"}}}

" Nop mapping"{{{
nnoremap <F1> <Nop>
vnoremap q <Nop>
vnoremap ZQ <Nop>
vnoremap ZZ <Nop>

nnoremap <Ins> <Nop>
inoremap <Ins> <Nop>

nnoremap <RightMouse> p
inoremap <RightMouse> <C-r>"

noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
"}}}

" others mapping"{{{
function! s:set_current_filetype() abort
    execute "set filetype=" . &filetype
endfunction
nnoremap <F4> :<C-u>call <SID>set_current_filetype()<CR>

function! GitCtags() abort
    let l:git_root = system("git rev-parse --show-toplevel | tr -d '\\n'")
    let l:git_folder = l:git_root . "/.git"
    let l:current_folder = getcwd()
    if l:git_folder[-4:] == ?".git"
        execute "cd " . l:git_root
        let l:tags_path = l:git_folder . '/tags'
        execute "set tags+=" . l:tags_path . ";"
        execute "!start ctags --sort=yes --append=no -f " . l:tags_path . " -R " . l:git_root
        execute "cd " . l:current_folder
    else
        echomsg "None .git error"
    endif
endfunction
command! GitaCtagsCommand call GitCtags()
nnoremap <C-F3> :<C-u>GitaCtagsCommand<CR>

function! OpenWorkText() abort
	let l:work_text_file_path =  "~/worktexts/".strftime("%Y_%m_%d.txt")
	execute "tab drop ".l:work_text_file_path
	execute "set filetype=worktext"
endfunction
command! OpenWorkTextCommand call OpenWorkText()
nnoremap <Space>ew :<C-u>OpenWorkTextCommand<CR>

nnoremap <Space>em i<C-@>
nnoremap <Space>ec :<C-u>!start ConEmu64.exe<CR>

nnoremap <Space>ej :<C-u>execute "normal".line(".")."gg"<CR>
"}}}

" substitute mapping"{{{
nnoremap [substitute] <Nop>
nmap <Space>s [substitute]
vnoremap [substitute] <Nop>
vmap <Space>s [substitute]

nnoremap [substitute]f  :<C-u>%s/\v//g<Left><Left><Left>
vnoremap [substitute]f  :s/\v%V%V//g<Left><Left><Left><Left><Left>
nnoremap [substitute]iw :<C-u>%s/\v//g<Left><Left><Left><C-r><C-w><Right>
nnoremap [substitute]w :<C-u>%s/\v//g<Left><Left><Left><C-r><C-w><Right><C-r><C-w>
nnoremap [substitute]iv <Right>byegv:<C-u>'<,'>s/\v%V%V//g<Left><Left><Left><Left><Left><C-r>"<Right><Right><Right>
nnoremap [substitute]v <Right>byegv:<C-u>'<,'>s/\v%V%V//g<Left><Left><Left><Left><Left><C-r>"<Right><Right><Right><C-r>"
nnoremap [substitute]iy  :<C-u>%s/\v//g<Left><Left><Left><C-r>"<Right>
nnoremap [substitute]y  :<C-u>%s/\v//g<Left><Left><Left><C-r>"<Right><C-r>"
vnoremap [substitute]iy  :<C-u>'<,'>%s/\v//g<Left><Left><Left><C-r>"<Right>
vnoremap [substitute]y  :<C-u>'<,'>%s/\v//g<Left><Left><Left><C-r>"<Right><C-r>"<Right>
nnoremap [substitute]c  :<C-u>%s/\C\v//g<Left><Left><Left>
vnoremap [substitute]c  :<C-u>'<,'>%s/\C\v//g<Left><Left><Left>
nnoremap [substitute]d  :<C-u>%s/\v$//g<Left><Left>
vnoremap [substitute]d  :<C-u>'<,'>%s/\v$//g<Left><Left>

nnoremap [substitute]e :<C-u>v//d<Left><Left>
vnoremap [substitute]e :v//d<Left><Left>
nnoremap [substitute]i :<C-u>g//d<Left><Left>
vnoremap [substitute]i :g//d<Left><Left>
"}}}

" replace mapping"{{{
nnoremap [replace] <Nop>
nmap <Space>r [replace]
vnoremap [replace] <Nop>
vmap <Space>r [replace]

function! s:nvnoremap_replace(lhs, pattern, str) abort
    let pattern = substitute(a:pattern, '\', '\\\\', 'g')
    let str = substitute(a:str, '\', '\\\\', 'g')
    let substitute_str = 's/\\v' . pattern . "/" . str . "/ge\\|noh"
    let v_substitute_str = "'<,'>" . 's/\\v%V' . pattern . "%V/" . str . "/g"
    silent execute join(["nnoremap", "<silent>", "[replace]" . a:lhs, 'q::s@^@' . substitute_str . '@g<CR><CR>'])
    silent execute join(["vnoremap", "<silent>", "[replace]" . a:lhs, 'q::s@^.*$@' . v_substitute_str . '@g<CR><CR>'])
endfunction

let s:LHS_KEY = "l"
let s:PATTERN_KEY = "p"
let s:STR_KEY = "s"
let s:replace_map_info = [
\   {s:LHS_KEY : "co", s:PATTERN_KEY : '\S{-1,}\zs,\ze\S{-1,}', s:STR_KEY : ', '},
\   {s:LHS_KEY : "e", s:PATTERN_KEY : '\S{-1,}\zs(\=\| \=\|\= )\ze\S{-1,}', s:STR_KEY : ' = '},
\   {s:LHS_KEY : "n", s:PATTERN_KEY : '^\n', s:STR_KEY : ""},
\   {s:LHS_KEY : "p", s:PATTERN_KEY : '\\', s:STR_KEY : '\/'},
\   {s:LHS_KEY : "P", s:PATTERN_KEY : '\/', s:STR_KEY : '\\'},
\   {s:LHS_KEY : "<Space>e", s:PATTERN_KEY : ' +$', s:STR_KEY : ''},
\   {s:LHS_KEY : "mc", s:PATTERN_KEY : '\_.*\ze\n', s:STR_KEY : "\\=join(split(submatch(0), \"\\n\"), \",\")"},
\   {s:LHS_KEY : "mt", s:PATTERN_KEY : '\_.*\ze\n', s:STR_KEY : "\\=join(split(submatch(0), \"\\n\"), \"\\t\")"},
\   {s:LHS_KEY : "<Space>b", s:PATTERN_KEY : '\S{-1,}\zs {2,}\ze\S{-1,}', s:STR_KEY : ' '},
\   {s:LHS_KEY : "cm", s:PATTERN_KEY : ',', s:STR_KEY : '\r'},
\   {s:LHS_KEY : "tm", s:PATTERN_KEY : '\t', s:STR_KEY : '\r'},
\   {s:LHS_KEY : "qw", s:PATTERN_KEY : "'", s:STR_KEY : '"'},
\   {s:LHS_KEY : "wq", s:PATTERN_KEY : '"', s:STR_KEY : "'"},
\   {s:LHS_KEY : "cc", s:PATTERN_KEY : '_(.)', s:STR_KEY : '\u\1'},
\   {s:LHS_KEY : "ch", s:PATTERN_KEY : '([A-Z])', s:STR_KEY : '_\l\1'},
\   {s:LHS_KEY : "ct", s:PATTERN_KEY : ',', s:STR_KEY : '\t'},
\   {s:LHS_KEY : "tc", s:PATTERN_KEY : '\t', s:STR_KEY : ','},
\   {s:LHS_KEY : "<Space>a", s:PATTERN_KEY : '^\s+', s:STR_KEY : ''},
\   {s:LHS_KEY : "x", s:PATTERN_KEY : '%#(\_.)(\_.)', s:STR_KEY : '\2\1'},
\]

if exists("g:replace_map_info")
    let s:replace_map_info += g:replace_map_info
    unlet g:replace_map_info
endif

for info in s:replace_map_info
    call s:nvnoremap_replace(info[s:LHS_KEY], info[s:PATTERN_KEY], info[s:STR_KEY])
endfor
"}}}

" yank mapping"{{{
nnoremap [yank] <Nop>
nmap <Space>y [yank]

function! s:yank_now(delimiter) abort
    let delimiter = a:delimiter == "" ? "_" : a:delimiter
    call s:yank_value(strftime(join(split("%Y_%m_%d","_"),a:delimiter)))
endfunction
nnoremap [yank]n :<C-u>call <SID>yank_now("\/")<CR>

nnoremap [yank]f :<C-u>call <SID>yank_value(expand("%"))<CR>

nnoremap [yank]p :<C-u>call <SID>yank_value(substitute(expand("%:p"), "\\", "/", "g"))<CR>

nnoremap [yank]; :<C-u>call <SID>yank_value(@:)<CR>

nnoremap [yank]/ :<C-u>call <SID>yank_value(@/)<CR>

nnoremap [yank]i :<C-u>call <SID>yank_value(@.)<CR>

nnoremap <silent> [yank]k :<C-u>call <SID>yank_value(cfi#format("%s", ""))<CR>

function! s:yank_value(value) abort
    let @" = a:value
    let @+ = a:value
    let @0 = a:value
    let @* = a:value
    echomsg "yank ". a:value
endfunction
"}}}

" inner and around vomapping"{{{
function! s:inner_around_vomap(lhs, rhs) abort
    let inner_lhs = "i" . a:lhs
    let inner_rhs = "i" . a:rhs
    let around_lhs = "a" . a:lhs
    let around_rhs = "a" . a:rhs
    silent execute join(["vnoremap", inner_lhs, inner_rhs])
    silent execute join(["onoremap", inner_lhs, inner_rhs])
    silent execute join(["vnoremap", around_lhs, around_rhs])
    silent execute join(["onoremap", around_lhs, around_rhs])
endfunction
call s:inner_around_vomap(";", "B")
call s:inner_around_vomap("o", "p")
call s:inner_around_vomap("f", "w")
call s:inner_around_vomap("t", ">")
call s:inner_around_vomap("T", "t")
call s:inner_around_vomap("p", ")")
call s:inner_around_vomap("l", "]")
call s:inner_around_vomap("w", "\"")
call s:inner_around_vomap("q", "\'")
call s:inner_around_vomap("d", "}")
call s:inner_around_vomap("b", "`")
"}}}

" fold mapping"{{{
noremap [fold] <Nop>
map <Leader>z [fold]
noremap [fold]j zj
noremap [fold]k zk
noremap [fold]n ]z
noremap [fold]p [z
noremap [fold]h zc
noremap [fold]l zo
noremap [fold]a za
noremap [fold]m zM
noremap [fold]i zMzv
noremap [fold]r zR
noremap [fold]f zf
noremap [fold]d zd
noremap zD <Nop>
"}}}

" command and insert mapping"{{{

" 移動
noremap! <C-h> <Left>
noremap! <C-j> <Down>
noremap! <C-k> <Up>
noremap! <C-l> <Right>
noremap! <C-e> <End>
inoremap <C-a> <C-r>=MyExecExCommand('normal ^')<CR>
cnoremap <C-a> <Home>

" 編集
noremap! <C-b> <BS>
noremap! <C-d> <Del>
inoremap <C-o> <C-g>u<C-r>=MyExecExCommand('normal o')<CR>

" undo redo
inoremap <M-u> <C-g>u<C-r>=MyExecExCommand('undo', 'onemore')<CR>
inoremap <M-r> <C-r>=MyExecExCommand('redo', 'onemore')<CR>

" インデント
inoremap <S-TAB> <C-d>

" 電卓
inoremap j<Space><CR> <C-r>=

" 日本語入力固定切り替え
inoremap <F10> <C-^><C-r>=IMState('FixMode')<CR>

" 大文字入力切り替え
imap j<Space>j <Plug>CapsLockToggle

" カーソル位置の単語を大文字に変換
inoremap j<Space><Space> <ESC>gUiwea

" 前に入力した文字を入力
inoremap j<Space>z <C-a>


""""""""""""""""""""""""""""""
"IMEの状態とカーソル位置保存のため<C-r>を使用してコマンドを実行。
""""""""""""""""""""""""""""""
function! MyExecExCommand(cmd, ...)
    let saved_ve = &virtualedit
    let index = 1
    while index <= a:0
        if a:{index} == 'onemore'
            silent setlocal virtualedit+=onemore
        endif
        let index = index + 1
    endwhile

    silent exec a:cmd
    if a:0 > 0
        silent exec 'setlocal virtualedit='.saved_ve
    endif
    return ''
endfunction

function! s:cinoremap_with_prefix(lhs_prefix, lhs_suffix, rhs) abort
    silent execute join(["noremap!", a:lhs_prefix . a:lhs_suffix, a:rhs])
endfunction
let s:MAIN_INPUT_PREFIX_KEY = "j<Space>"
let s:SUB_INPUT_PREFIX_KEY = "jk"

let s:LHS_PRF_KEY = "lhs_prefix"
let s:RHS_KEY = "rhs"
let s:main_cinoremap_info = [
            \ {s:LHS_PRF_KEY : "a", s:RHS_KEY : "-"},
            \ {s:LHS_PRF_KEY : "e", s:RHS_KEY : "="},
            \ {s:LHS_PRF_KEY : "s", s:RHS_KEY : "_"},
            \ {s:LHS_PRF_KEY : "r", s:RHS_KEY : "<Bar>"},
            \ {s:LHS_PRF_KEY : "g", s:RHS_KEY : "\\"},
            \ {s:LHS_PRF_KEY : "w", s:RHS_KEY : "\"\"<Left>"},
            \ {s:LHS_PRF_KEY : "b", s:RHS_KEY : "``<Left>"},
            \ {s:LHS_PRF_KEY : "l", s:RHS_KEY : "[]<Left>"},
            \ {s:LHS_PRF_KEY : "t", s:RHS_KEY : "<><Left>"},
            \ {s:LHS_PRF_KEY : "p", s:RHS_KEY : "()<Left>"},
            \ {s:LHS_PRF_KEY : "d", s:RHS_KEY : "{}<Left>"},
            \ {s:LHS_PRF_KEY : "q", s:RHS_KEY : "''<Left>"},
            \ {s:LHS_PRF_KEY : "h", s:RHS_KEY : "<C-r>\""},
            \ {s:LHS_PRF_KEY : "k", s:RHS_KEY : "<End><C-u>"},
            \ {s:LHS_PRF_KEY : "u", s:RHS_KEY : "<C-u>"},
            \ {s:LHS_PRF_KEY : "c", s:RHS_KEY : "<End><C-u><C-u>"},
            \ {s:LHS_PRF_KEY : "v", s:RHS_KEY : "<C-q>"},
            \ {s:LHS_PRF_KEY : "T", s:RHS_KEY : "<C-x><C-]>"},
            \]
for info in s:main_cinoremap_info
    call s:cinoremap_with_prefix(s:MAIN_INPUT_PREFIX_KEY, info[s:LHS_PRF_KEY], info[s:RHS_KEY])
endfor

let s:sub_cinoremap_info = [
            \ {s:LHS_PRF_KEY : "a", s:RHS_KEY : "&"},
            \ {s:LHS_PRF_KEY : "h", s:RHS_KEY : "^"},
            \ {s:LHS_PRF_KEY : "p", s:RHS_KEY : "+"},
            \ {s:LHS_PRF_KEY : "s", s:RHS_KEY : "#"},
            \ {s:LHS_PRF_KEY : "r", s:RHS_KEY : "%"},
            \ {s:LHS_PRF_KEY : "m", s:RHS_KEY : "@"},
            \ {s:LHS_PRF_KEY : "t", s:RHS_KEY : "~"},
            \ {s:LHS_PRF_KEY : "d", s:RHS_KEY : "$"},
            \ {s:LHS_PRF_KEY : "e", s:RHS_KEY : "!"},
            \ {s:LHS_PRF_KEY : "b", s:RHS_KEY : "`"},
            \ {s:LHS_PRF_KEY : "c", s:RHS_KEY : ":"},
            \ {s:LHS_PRF_KEY : "x", s:RHS_KEY : "*"},
            \ {s:LHS_PRF_KEY : "q", s:RHS_KEY : "?"},
            \ {s:LHS_PRF_KEY : ";", s:RHS_KEY : "\""},
            \ {s:LHS_PRF_KEY : ",", s:RHS_KEY : "'"},
            \ {s:LHS_PRF_KEY : "g", s:RHS_KEY : "=>"},
            \ {s:LHS_PRF_KEY : "f", s:RHS_KEY : "->"},
            \]
for info in s:sub_cinoremap_info
    call s:cinoremap_with_prefix(s:SUB_INPUT_PREFIX_KEY, info[s:LHS_PRF_KEY], info[s:RHS_KEY])
endfor

"}}}

" macro mapping"{{{
nnoremap [macro] <Nop>
nmap q [macro]
nnoremap [macro]r qa
nnoremap [macro]q q
nnoremap [macro]s @a
nnoremap [macro]d qaq
"}}}

" diff mapping"{{{
nnoremap [diff] <Nop>
nmap <Leader>d [diff]
vnoremap [diff] <Nop>
vmap <Leader>d [diff]

function! s:diff_tab_open(...)
    if a:0 == 1
        tabedit %:p
        execute "rightbelow vertical diffsplit " . a:1
    else
        execute "tabedit " . a:1
        for l:file in a:000[1:]
            execute "rightbelow vertical diffsplit " . l:file
        endfor
    endif
endfunction
command! -nargs=+ -complete=file MyDiff call <SID>diff_tab_open(<f-args>)
nnoremap [diff]i :<C-u>MyDiff<Space>
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
nnoremap [diff]o :<C-u>DiffOrig<CR>

nnoremap [diff]j ]c
nnoremap [diff]k [c
nnoremap [diff]g :<C-u>diffget<CR>
nnoremap [diff]p :<C-u>diffput<CR>
vnoremap [diff]j ]c
vnoremap [diff]k [c
vnoremap [diff]g :diffget<CR>
vnoremap [diff]p :diffput<CR>
"}}}

" mark"{{{
nnoremap [mark] <Nop>
vnoremap [mark] <Nop>
nmap <Leader>m [mark]
vmap <Leader>m [mark]

nnoremap [mark]s :<C-u>call tmno3#mark#set()<CR>

nnoremap <expr> <silent> [mark]x tmno3#mark#to_next()
vnoremap <expr> <silent> [mark]x tmno3#mark#to_next()

nnoremap <expr> <silent> [mark]r tmno3#mark#to_previous()
vnoremap <expr> <silent> [mark]r tmno3#mark#to_previous()

nnoremap <silent> [mark]d :<C-u>call tmno3#mark#delete_all()<CR>

nnoremap [mark]g '
vnoremap [mark]g '
"}}}

" arithmatic"{{{
nnoremap [arith] <Nop>
vnoremap [arith] <Nop>
nmap <Space>a [arith]
vmap <Space>a [arith]

nnoremap [arith]j <C-x>
nnoremap [arith]k <C-a>
vnoremap [arith]j <C-x>gv
vnoremap [arith]K <C-a>gv
"}}}
