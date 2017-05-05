
call denite#custom#option('default', 'direction', 'dynamictop')
call denite#custom#option('default', 'use-default-mappings', 'false')


call denite#custom#map('_', '<CR>', '<denite:do_action:default>', 'noremap')
call denite#custom#map('_', '<Tab>', '<denite:choose_action>', 'noremap')

let s:LHS_KEY = tmno3#mapping#get_lhs_key()
let s:RHS_KEY = tmno3#mapping#get_rhs_key()
for s:info in tmno3#mapping#main_input()
    call denite#custom#map('insert', s:info[s:LHS_KEY], s:info[s:RHS_KEY], 'noremap')
endfor
for s:info in tmno3#mapping#sub_input()
    call denite#custom#map('insert', s:info[s:LHS_KEY], s:info[s:RHS_KEY], 'noremap')
endfor

call denite#custom#map('insert', '<C-h>', '<denite:move_caret_to_left>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-l>', '<denite:move_caret_to_right>', 'noremap')
call denite#custom#map('insert', '<C-b>', '<denite:delete_char_before_caret>', 'noremap')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'jq', '<denite:quit>', 'noremap')
call denite#custom#map('insert', '<C-u>', '<denite:delete_text_before_caret>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:assign_next_matched_text>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:assign_previous_matched_text>', 'noremap')
call denite#custom#map('insert', 'j<Space>h', '<denite:paste_from_default_register>', 'noremap')
call denite#custom#map('insert', 'j<Space>v', '<denite:insert_special>', 'noremap')

call denite#custom#map('normal', 'q', '<denite:quit>', 'noremap')
call denite#custom#map('normal', 'gg', '<denite:move_to_first_line>', 'noremap')
call denite#custom#map('normal', 'G', '<denite:move_to_last_line>', 'noremap')
call denite#custom#map('normal', 'i', '<denite:enter_mode:insert>', 'noremap')
call denite#custom#map('normal', 'I', '<denite:insert_to_head>', 'noremap')
call denite#custom#map('normal', 'a', '<denite:append>', 'noremap')
call denite#custom#map('normal', 'A', '<denite:append_to_line>', 'noremap')
call denite#custom#map('normal', 'h', '<denite:move_caret_to_left>', 'noremap')
call denite#custom#map('normal', 'j', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', 'k', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', 'l', '<denite:move_caret_to_right>', 'noremap')
call denite#custom#map('normal', 'b', '<denite:move_caret_to_one_word_left>', 'noremap')
call denite#custom#map('normal', 'w', '<denite:move_caret_to_next_word>', 'noremap')
call denite#custom#map('normal', 'e', '<denite:move_caret_to_end_of_word>', 'noremap')
call denite#custom#map('normal', 'ga', '<denite:move_caret_to_head>', 'noremap')
call denite#custom#map('normal', 'ge', '<denite:move_caret_to_tail>', 'noremap')
call denite#custom#map('normal', 'cc', '<denite:change_line>', 'noremap')
call denite#custom#map('normal', 'dd', '<denite:delete_entire_text>', 'noremap')
call denite#custom#map('normal', 'D', '<denite:delete_text_before_caret>', 'noremap')
call denite#custom#map('normal', 'x', '<denite:delete_char_under_caret>', 'noremap')
call denite#custom#map('normal', 'sm', '<denite:toggle_select_down>', 'noremap')
call denite#custom#map('normal', 'ss', '<denite:toggle_select_all>', 'noremap')
call denite#custom#map('normal', 'yy', '<denite:yank_to_default_register>', 'noremap')
call denite#custom#map('normal', 'p', '<denite:paste_from_default_register>', 'noremap')
call denite#custom#map('normal', 'v', '<denite:do_action:preview>', 'noremap')
call denite#custom#map('normal', 'o', '<denite:do_action:open>', 'noremap')
call denite#custom#map('normal', 'sv', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', 'sh', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', 't<Space>', '<denite:do_action:tabopen>', 'noremap')
call denite#custom#map('normal', '<C-l>', '<denite:redraw>', 'noremap')
call denite#custom#map('normal', 'rr', '<denite:restart>', 'noremap')

