
" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#rename_command = '<Nop>'
" let g:jedi#popup_select_first = 0
" let g:jedi#documentation_command='<Nop>'
" let g:jedi#force_py_version = 3
"
" " docstringは表示しない
" autocmd FileType python setlocal completeopt-=preview

let s:bundle=neobundle#get('jedi-vim')
function! s:bundle.hooks.on_source(bundle)
    setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#rename_command = '<Nop>'
    let g:jedi#popup_select_first = 0
    let g:jedi#documentation_command='<Nop>'
    let g:jedi#force_py_version = 3
    " docstringは表示しない
    setlocal completeopt-=preview
endfunction
unlet s:bundle
