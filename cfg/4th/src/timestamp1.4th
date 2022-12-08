\ timestamp v1
\ yyyymmddhhmmss
empty

variable ptr
: digs   0 do # loop ;
: fmt    >r 0 <# r@ digs #> pad ptr @ + swap move r> ptr +! ;
: fmt    4 fmt 5 0 do 2 fmt loop ; : mkts time&date fmt ;
: new    mkts pad 14 ['] str ;
: ts    ." 000000000000000" ;
