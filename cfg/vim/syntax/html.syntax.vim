" html

"	if exists('b:current_syntax') | finish | endif
  if expand("%:e") != "html"    | finish | endif
" setl ts=12 et

" function! VisualTagsWrap()
"   if !exists('g:tags_to_wrap') | let g:tags_to_wrap=[] | endif
"   let g:tags_to_wrap = split(
"       input('space separated tags to wrap block: ',
"       join(g:tags_to_wrap, ' ')), '\s\+')
"   if len(g:tags_to_wrap) > 0
"       execute 'normal! `>a</'.join(reverse(g:tags_to_wrap), '></').'>'
"       execute 'normal! `<i<'.join(reverse(g:tags_to_wrap), '><').'>'
"   endif
" endfunction
" vnoremap <silent>,w <ESC>:call VisualTagsWrap()<CR>

nn .H :0r !cat $cfg/vim/content/html.html<cr>j
