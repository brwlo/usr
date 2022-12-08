2v: fname v: file
: fname" bl word count ;
: fmake  r/w create-file ;
: fopen  r/w open-file ;
: fopen  2dup fopen 0= if file ! 2drop exit then drop fmake throw file ! ;
: fwrite file @ write-file throw ; ( appends )
: fclose file @ close-file throw ;

: "write fopen fwrite fclose ;
: write" ( buf len "file ) fname" "write ;
