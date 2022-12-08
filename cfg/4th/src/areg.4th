v: areg
: a!   areg ! ;

: a+   1 cells areg +! ;
: @a   areg @ @ ;
: @+   @a a+ ;
: +@   a+ @a ;

: c+   1 chars areg +! ;
: @c   areg @ c@ ;
: @c+  @c c+ ;
: +@c  c+ @c ;
