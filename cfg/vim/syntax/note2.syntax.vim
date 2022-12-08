if expand("%:e") != "note2" | finish | endif

sy match aa '^=.*'
sy match bb '^\t.*'
sy match cc '^\t\t.*'
sy match dd '^\t\t\t.*'
sy match ee '^\t\t\t\t.*'
sy match ff '^\t\t\t\t\t.*'

hi aa ctermfg=red
hi bb ctermfg=magenta
hi cc ctermfg=yellow
hi dd ctermfg=blue
hi ee ctermfg=green
hi ff ctermfg=cyan
