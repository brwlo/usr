\ falvos's text-preprocessor
\ youtube.com/watch?v=mvrE2ZGe-rs
\ gforth
\ example src: a little lamb > me & ~iw italics
emp cc

( config )
: srcfile  s" /home/tc/usr/ram/4th/data" ;
: outfile  s" /home/tc/usr/ram/4th/zout" ;

( input buffer )
variable 'src
variable #src
variable 'out
variable #out

variable fh
: open     srcfile r/o open-file throw fh ! ;
: read     begin here 4096 fh @ read-file throw dup allot 0= until ;
: close    fh @ close-file throw ;
: gulp     open read close ;
: start    here 'src ! ;
: finish   here 'src @ - #src ! ;
: slurp    start gulp finish ;
: open     outfile r/w create-file throw fh ! ;
: write    'out @ #out @ fh @ write-file throw ;
: spew     open write close ;

( vectored output )
: b-emit   c, ;
: b-type   begin dup while over c@ emit 1 /string repeat 2drop ;
: buffered ['] b-emit is emit ['] b-type is type ;
: interact ['] (emit) is emit ['] (type) is type ;
: start    here 'out ! buffered ;
: finish   here 'out @ - #out ! interact ;

( command dispatcher )
variable offset
variable 'token
variable #token
: addr     'src @ offset @ + ;
: chr      addr c@ ;
: -ws      32 u> ;
: advance  1 offset +! ;
: seek     begin chr -ws while advance repeat ;
: token    addr seek addr over - advance 2dup #token ! 'token ! ;
: .token   'token @ #token @ type ;
: error    cr cr .token -1 abort" ----------  NOT FOUND" ;
: comm     token sfind if execute else error then ;

: rdrop    postpone r> postpone drop ; immediate
: call     >r ;
: ent      [char] & emit type [char] ; emit ;
: ===>     over = if drop r> call ent rdrop exit then rdrop ;
: either&  [char] & ===> s" amp" ;
: or<      [char] < ===> s" lt"  ;
: or>      [char] > ===> s" gt"  ;
: orEsc    dup [char] ~ = if drop comm rdrop exit then ;
: interp   chr advance either& or< or> orEsc ( else ) emit ;
: -end     offset @ #src @ u< ;
: format   0 offset ! begin -end while interp repeat ;
: proc     start format finish ;

( commands )
: iw       ." <i>" token type ." </i> " ;
: bw       ." <b>" token type ." </b> " ;

( main )
: weave     slurp proc spew format ; weave
\ bye
