call minpac#add('junegunn/vim-emoji')

call minpac#add('thinca/vim-themis')
call minpac#add('notomo/vusted', {'depth': 0})
call minpac#add('notomo/virtes.nvim', {'depth': 0})
call minpac#add('notomo/genvdoc', {'depth': 0})

autocmd MyAuGroup FileType typescriptreact set filetype=typescript.tsx

if has('unix')
    call minpac#add('lambdalisue/suda.vim')
    let g:suda_startup = 1
    nnoremap [file]W :<C-u>write suda://%<CR>
endif

if !has('win32')
    call minpac#add('ujihisa/neco-look')
endif

call minpac#add('w0rp/ale')
source ~/.vim/rc/plugins/ale.vim

if executable('python3')
    call minpac#add('Shougo/deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
endif

call minpac#add('Shougo/deoplete-lsp')

call minpac#add('voldikss/vim-translator')
nnoremap [keyword]T :<C-u>Translate<CR>
xmap T <Plug>TranslateV
let g:translator_target_lang = 'ja'
let g:translator_default_engines = ['google']
let g:translator_history_enable = 1

call minpac#add('notomo/suball.vim', {'depth': 0})
nnoremap <expr> [substitute]aw ':%' . suball#input(expand('<cword>'), "")
nnoremap <expr> [substitute]ay ':%' . suball#input(@+, "")

call minpac#add('notomo/searcho.nvim', {'depth': 0})
nnoremap <expr> / searcho#do('forward') .. '\v'
nnoremap <expr> sJ searcho#do('stay_forward') .. '\v(^\|[^[:alnum:]])\zs' .. expand('<cword>') .. searcho#with_left('\ze([^[:alnum:]]\|$)')
nnoremap <expr> sK searcho#do('stay_backward') .. '\v(^\|[^[:alnum:]])\zs' .. expand('<cword>') .. searcho#with_left('\ze([^[:alnum:]]\|$)')
nnoremap <expr> sj searcho#do('stay_forward') .. expand('<cword>')
nnoremap <expr> sk searcho#do('stay_backward') .. expand('<cword>')
nnoremap <expr> s<Space>j searcho#do('forward') .. '\v' .. @"
nnoremap <expr> s<Space>k searcho#do('backward') .. '\v' .. @"
nnoremap <expr> n searcho#do('next')
nnoremap <expr> N searcho#do('prev')
autocmd MyAuGroup User SearchoSourceLoad call s:searcho_settings()
function! s:searcho_settings() abort
    lua << EOF
local keymaps = require('searcho/search').keymaps
table.insert(keymaps, {
    lhs = "<Space>",
    rhs = "<CR>",
    noremap = true,
})
table.insert(keymaps, {
    lhs = "<CR>",
    rhs = "<CR><Cmd>lua require('reacher').start({input = vim.fn.getreg('/')})<CR><ESC>",
    noremap = true,
})
table.insert(keymaps, {
    lhs = "<Tab>",
    rhs = "<C-g>",
    noremap = true,
})
table.insert(keymaps, {
    lhs = "<S-Tab>",
    rhs = "<C-t>",
    noremap = true,
})
table.insert(keymaps, {
    lhs = "<C-Space>",
    rhs = "<Space>",
    noremap = true,
})
EOF
endfunction

call minpac#add('notomo/wintablib.nvim', {'depth': 0})
function! MakeTabLine()
    return luaeval('require("wintablib.tab").line()')
endfunction
set tabline=%!MakeTabLine()

call minpac#add('tbastos/vim-lua')

call minpac#add('notomo/lreload.nvim', {'depth': 0})

call minpac#add('nanotee/luv-vimdocs')
