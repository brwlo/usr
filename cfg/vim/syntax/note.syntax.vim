" note.vim (wz6ihsq, bw)

" padrão para achar linhas no arquivo eph/.note: /\v^#.+((\n[^#])+[^#]+)*

"initial

  if exists("b:current_syntax") | fini | en
  if expand("%:e") != "note2" | finish | endif
  if expand('%:p:h:t') =~ '\v[0-z_x]{15}-.*'
   so $mSYS/vim/syntax/note.vim.q | fini | en

"commands

"  fold me

"autocommands

  aug note | au!

"  au BufEnter *.nt cal N_AddHeader()

  aug end

"settings

  sy sync fromstart
  setl fdm=syntax
  setl wrap
  setl ts&
" setl isk-=#

  setl fo+=ron
" setl flp="^\s*\d\+[\]:.)}\t ]\s*"

  setl com+=s:#,m:│,e:│
  setl com+=s::,m:┊,e:┊
  setl com+=s:>,m:│,e:│
  setl com+=s:~,m:~,e:~
  setl com+=s:¦,m:¦,e:¦
  setl com+=s:\|,m:\|,e:\|

  setl com+=s:1,m:┆,e:┆
  setl com+=s:2,m:┆,e:┆
  setl com+=s:3,m:┆,e:┆
  setl com+=s:4,m:┆,e:┆
  setl com+=s:5,m:┆,e:┆
  setl com+=s:6,m:┆,e:┆
  setl com+=s:7,m:┆,e:┆
  setl com+=s:8,m:┆,e:┆
  setl com+=s:9,m:┆,e:┆

"syntax

  "Notes (#:!)
  sy match note1 '\v#\w{7}'	| hi note1 guifg=red ctermfg=red
  sy match note2 '\v:\w{7}'	| hi note2 guifg=yellow ctermfg=yellow
  sy match note3 '\v\!\w{7}'	| hi note3 guifg=magenta ctermfg=magenta

  "First Column Symbols
  sy match bar1 '^│'	| hi bar1 ctermfg=red guifg=red
  sy match bar2 '^┊'	| hi bar2 ctermfg=yellow guifg=yellow
  sy match bar3 '^¦'	| hi bar3 ctermfg=green guifg=green
  sy match bar4 '^|'	| hi bar4 ctermfg=green guifg=green
  sy match bar5 '^!.*$'	| hi bar5 ctermfg=magenta guifg=magenta
  sy match bar6 '^\~.*$'| hi bar6 ctermfg=cyan guifg=cyan
  sy match bar7 '^┆'	| hi bar7 ctermfg=blue guifg=blue
  sy match bar8 '^-.*$'	| hi bar8 ctermfg=gray guifg=gray
  sy match file '^>'	| hi file ctermfg=green guifg=green
  sy match numr '^\d\+'	| hi numr ctermfg=yellow guifg=yellow

  "Object matter
  sy match matter '\v<(PRS|FIN|WRK|JUR|INF|OTH)>'| hi matter ctermfg=magenta guifg=magenta

  "Status indicators
  sy match sttRed '\v<PER|URG>'	| hi sttRed ctermfg=red guifg=red
  sy match sttYelw '\v<PEN|SUS>'| hi sttYelw ctermfg=yellow guifg=yellow
  sy match sttCyan '\v<INC>'	| hi sttCyan ctermfg=cyan guifg=cyan
  sy match sttGreen '\v<ARQ>'	| hi sttGreen ctermfg=green guifg=green

  "Other
  sy match general '\v\<[^>]+\>'| hi general ctermfg=blue guifg=blue

"folds

  sy region fnote1 start='\v^#[[:alnum:]]{7}' end='\v\n\ze#[[:alnum:]]{7}' transparent fold
" sy region fnote2 start='\v^:[[:alnum:]]{7}' end='\v\n\ze[#:][[:alnum:]]{7}' transparent fold

"abbreviations

  ia AG] André Gasparin
  ia BG] Bruno Gasparin
  ia CG] Cristiane Gasparin
  ia UG] Ubirajara Gasparin
  ia MJ] Maria Jáskiu
  ia MFS] Márcia Ferreira dos Santos
