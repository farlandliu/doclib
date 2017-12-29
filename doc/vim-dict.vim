" Name: Vim dict
" Author: farland <farlamd@163.com>
" Version: 0.3.0
if exists('vim-dict')
    echo 'not found vim-dict'
"   finish
endif

let s:VERSION = '0.4.0'

function! s:get_word () " {{{
    let l:mode = mode()

    if l:mode == 'n'
        return expand('<cWORD>')
    elseif l:mode == 'v' || l:mode == 'V' || l:mode == ""
        if line("'<") != line("'>")
            return ''
        endif
        return getline('.')[(col("'<") - 1):(col("'>") - 1)]
    elseif l:mode == 'i'
        let l:linetext = getline('.')
        let l:right = col('.') - 1
        let l:left = l:right
        while l:left > 1
            if l:linetext[(l:left - 1)] ==# ' '
                let l:left = l:left + 1
                break
            endif
            let l:left = l:left - 1
            echom l:linetext[(l:left - 1):(l:right - 1)]
        endwhile
        return l:linetext[(l:left - 1):(l:right - 1)]
    endif

    return expand('<cWORD>')
endfunction " }}}

function! s:query (word) " {{{
    let l:trimed_word = substitute(a:word, '\v[ \n\r]*$', '', '')
    let l:trimed_word = substitute(l:trimed_word, '\v[\n\r]', ' ', 'g')
    "let l:statsline_word = substitute(l:trimed_word, '\v[ \n\r]', '\\ ', 'g')
    echo l:trimed_word
    "execute 'setlocal statusline=[zdict]['. g:zdict_default_dict .']\ '. l:statsline_word
    "execute "silent r !zdict --dict ". g:zdict_default_dict ." --force-color '". l:trimed_word ."'"
endfunction " }}}


function! Query () " {{{
    let l:word = s:get_word()
 	echo 'querying '.l:word
    execute ' !dict '.l:word
    echo 'query completed!'
endfunction " }}}

command! Dict call Query()
nnoremap <silent> <Leader><Leader>z :call Query()<CR>
"execute 'nnoremap <silent> <Leader><Leader>z :Dcit<CR>'
