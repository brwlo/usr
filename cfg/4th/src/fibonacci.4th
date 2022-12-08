cc

\ aux
: ini dup 0< if drop 0 r> drop exit then dup 2 < if drop 1 r> drop exit then ;

\ worst
: f-1 dup 1- ; : f-2 swap 2 - ;
: fib recursive ini f-1 fib f-2 fib + ;

\ better
: fib recursive ini dup 2 - fib swap 1- fib + ;

\ best? - same as "better" but factored
\ : f-2 dup 2 - ; : f-1 swap 1- ;
\ : fib recursive ini f-2 fib f-1 fib + ;

\ test
: ei 50 0 do cr i . 4 spaces i fib . loop ;
