
for s:mode_char in ['n', 'v']
    call gina#custom#mapping#map(
    \ 'status', '[git]a',
    \ '<Plug>(gina-index-toggle)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'status', '[git]u',
    \ '<Plug>(gina-index-unstage)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'status', 'U',
    \ '<Plug>(gina-index-discard)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'stash', 'dr',
    \ '<Plug>(gina-stash-drop)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'patch', '[diff]p',
    \ '<Plug>(gina-diffput)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'patch', '[diff]G',
    \ '<Plug>(gina-diffget)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'patch', '[diff]gl',
    \ '<Plug>(gina-diffget-r)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'patch', '[diff]ga',
    \ '<Plug>(gina-diffget-l)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ '/\%(status\|stash\|branch\)', 'sm',
    \ '<Plug>(gina-builtin-mark)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ '/\%(status\|stash\|branch\)', 'su',
    \ '<Plug>(gina-builtin-mark-unset)',
    \ {'mode' : s:mode_char, 'silent' : 1},
    \)

    call gina#custom#mapping#map(
    \ 'status', '<Space>t',
    \ ':call gina#action#call(''edit:tab'')<CR>',
    \ {'noremap' : 1, 'mode' : s:mode_char, 'silent' : 1},
    \)

endfor

call gina#custom#mapping#nmap(
\ 'status', 'cc',
\ ':<C-u>Gina commit<CR>',
\ {'noremap' : 1, 'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ 'status', 'ca',
\ ':<C-u>Gina commit --amend<CR>',
\ {'noremap' : 1, 'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ '/\%(status\|stash\)', 'dd',
\ '<Plug>(gina-compare)',
\ {'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ '/\%(status\|stash\|compare\)', 'D',
\ '<Plug>(gina-diff)',
\ {'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ 'stash', 'ap',
\ '<Plug>(gina-stash-apply)',
\ {'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ 'stash', 'pop',
\ '<Plug>(gina-stash-pop)',
\ {'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ 'branch', 'rn',
\ '<Plug>(gina-branch-move)',
\ {'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ 'branch', 'rf',
\ '<Plug>(gina-branch-reflesh)',
\ {'silent' : 1},
\)

call gina#custom#mapping#nmap(
\ 'branch', 'C',
\ '<Plug>(gina-branch-new)',
\ {'silent' : 1},
\)

call gina#custom#command#option(
\ '/\%(status\|changes\|ls\)',
\ '--opener', 'botright split'
\)

call gina#custom#command#option(
\ '/\%(diff\|blame\|compare\|patch\|log\)',
\ '--opener', 'tabedit'
\)

call gina#custom#command#option('blame', '--width', '90')

call gina#custom#mapping#nmap('blame', 'j', 'j<Plug>(gina-blame-echo)')
call gina#custom#mapping#nmap('blame', 'k', 'k<Plug>(gina-blame-echo)')

let g:gina#command#blame#timestamper#format1 = '%Y-%m-%d'
let g:gina#command#blame#timestamper#format2 = '%Y-%m-%d'

call gina#custom#mapping#nmap(
\ 'diff', '[diff]j',
\ ':call tmno3#vimrc#to_next_syntax(''diffLine'', 1)<CR>',
\ {'noremap': 1, 'silent': 1},
\)

call gina#custom#mapping#nmap(
\ 'diff', '[diff]k',
\ ':call tmno3#vimrc#to_previous_syntax(''diffLine'', -1)<CR>',
\ {'noremap': 1, 'silent': 1},
\)

call gina#custom#mapping#nmap(
\ '/\%(log\|reflog\)', '<CR>',
\ ':call gina#action#call(''show:preview'')<CR>',
\ {'noremap': 1, 'silent': 1},
\)

call gina#custom#mapping#nmap(
\ 'log', 'cc',
\ '<Plug>(gina-changes-of)',
\ {'silent': 1},
\)

call gina#custom#mapping#nmap(
\ 'log', 'cf',
\ '<Plug>(gina-changes-from)',
\ {'silent': 1},
\)

call gina#custom#mapping#nmap(
\ 'log', 'cb',
\ '<Plug>(gina-changes-between)',
\ {'silent': 1},
\)

call gina#custom#mapping#nmap(
\ 'log', 'RS',
\ '<Plug>(gina-commit-reset)',
\ {'silent': 1},
\)

