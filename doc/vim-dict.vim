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
    echo l:trimed_word
endfunction " }}}


function! QueryCollins () " {{{
    let l:word = s:get_word()
    execute ' !dict '.l:word
endfunction " }}}

function! QueryBing () " {{{
    let l:word = s:get_word()
    execute ' !dict '.l:word.' -s bing'
endfunction " }}}

function! QueryAddToDeck () " {{{
    let l:word = s:get_word()
    execute ' !dict '.l:word.' -a'
endfunction " }}}

nnoremap <silent> <Leader><Leader>c :call QueryCollins()<CR>
nnoremap <silent> <Leader><Leader>b :call QueryBing()<CR>
nnoremap <silent> <Leader><Leader>m :call QueryAddToDeck()<CR>


