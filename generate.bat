flex lexical.l
bison syntaxique.y --defines=syntaxique.h -o projet.c
gcc lex.yy.c projet.c -o compil