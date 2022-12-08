\ bw cli
\ not good yet
lib string.fs

: _ulibs s" ~/usr/cfg/4th/src/" pad swap dup >r move r> ;
: ulibs  cr s" ls ~/usr/cfg/4th/src" system ;
: ulib  _ulibs parse-name rot pad + move ;
