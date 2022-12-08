\ slurp
\ use: slurp" <file> slurp[@|.]
2variable fname
: "slurp fname 2! ;
: slurp" bl word count "slurp ;
: fname  fname 2@ ;
variable file
variable 'slurp
variable #slurp
: open    fname r/o open-file throw file ! ;
: read    begin here 4096 file @ read-file throw dup allot 0= until ;
: close   file @ close-file throw ;
: gulp    open read close ;
: start   here 'slurp ! ;
: finish  here 'slurp @ - #slurp ! ;
: "slurp  "slurp start gulp finish ;
: slurp"  slurp" start gulp finish ;
: slurp@  'slurp @ #slurp @ ;
: slurp.  slurp@ type ;

v: pos v: saved
: reset   0 pos ! ;
: back    -1 pos +! ;
: fwd     1 pos +! ;
: save    pos @ saved ! ;
: restore saved @ pos ! ;
: where   'slurp @ pos @ + ;
: walk    where c@ fwd ;
: end     pos @ #slurp @ = ;
