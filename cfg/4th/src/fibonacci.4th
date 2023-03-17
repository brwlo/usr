( empty cc )
\ https://groups.google.com/g/comp.lang.forth/c/X3g-b8ApDzE/m/VueTC7FVDQAJ

\ aux
: ini dup 0< if drop 0 r> drop exit then dup 2 < if drop 1 r> drop exit then ;

\ worst
: f-1 dup 1- ; : f-2 swap 2 - ;
: fib1 recursive ini f-1 fib1 f-2 fib1 + ;

\ better
: fib recursive ini dup 2 - fib swap 1- fib + ;

\ best? - same as "better" but factored
\ : f-2 dup 2 - ; : f-1 swap 1- ;
\ : fib recursive ini f-2 fib f-1 fib + ;

\ fast
2v: pair
: sum  pair 2@ + ; : shw pair 2@ min ;
: cyc  dup 2 mod 1 min pair swap cells + ;
: ini  dup 1 min 1 pair 2! 1- dup 1 < if drop shw rdrop then ;
: fib  ini begin 1- cyc sum swap ! dup 0= until drop shw ;

\ test
: ei 50 0 do cr i . 4 spaces i fib . loop ;
