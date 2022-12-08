" syntax/vim.vim (wz8pbWw,bw)

" if exists('b:current_syntax')|fini|en
  if expand("%:e") != "vim"    | finish | endif

  setl fdm=syntax nowrap
  sy sync fromstart

  sy match level1 '^"[^"\t ].*'   |hi level1 ctermfg=red
  sy match level2 '^ "[^"\t ].*'  |hi level2 ctermfg=yellow
  sy match level3 '^  "[^"\t ].*' |hi comments ctermfg=lightgreen
  sy match level4 '^   "[^"\t ].*'|hi comments ctermfg=cyan
  sy match title  '\v%^.*$'	  |hi title ctermfg=red
  sy match cond '<(if|el|else|elsei(f)?|en(dif)?)>'
  sy match func '<fu(nction)?>|<endf(unction)?>'
  sy match loop '<wh(ile)?|endw(hile)?|for|endfo(r)?>'
  sy match vars '<(un)?let>'
  hi! cond cterm=bold ctermfg=yellow
  for i in ["func","loop","vars"]|hi! link i cond|endfo

  sy region fold1 start='^"[^"\t ]'  end='\ze\n"[^\t ]'     transparent fold
  sy region fold2 start='^ "[^"\t ]' end='\v\ze\n ="[^\t ]' transparent fold
