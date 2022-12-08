
if expand("%:e") != "plan" | finish | endif

sy match days    '\dª'
sy match hour    '\d\d:\d\d'
sy match desj    '\<desj\>'
sy match trab    '\<trab\>'
sy match passeio '\<passeio\>'
sy match orcezi  '\<orcezi\>'
sy match almoco  '\<almoço\>'
sy match correr  '\<correr\>'
sy match banho   '\<banho\>'
sy match leitura '\<leitura\>'
sy match dormir  '\<dormir\>'
sy match rezar   '\<rezar\>'
sy match special ':.\+:'

hi days    ctermfg=magenta
hi hour    ctermfg=magenta
hi desj    ctermfg=cyan
hi trab    ctermfg=red
hi passeio ctermfg=green
hi orcezi  ctermfg=yellow
hi almoco  ctermfg=green
hi correr  ctermfg=white
hi banho   ctermfg=cyan
hi leitura ctermfg=white
hi dormir  ctermfg=cyan
hi rezar   ctermfg=magenta
hi special ctermfg=red   ctermbg=white
