%{
#include <stdio.h>
#include "symbole.c"
int yylex();
int yyerror(char *s);
%}

%token  var mc_int mc_float mc_bool mc_idf mc_begin mc_for mc_if mc_end mc_rat mc_op pvg vg aff debut fin arc farc incr decr const_int const_float comment

%%

prog: LISTEDEC mc_begin LIST_INST mc_end {
 printf(" programme synt correct  \n "); YYACCEPT;

 }
;

VG: vg mc_idf VG | {test();}
;

VGCONST : vg mc_idf aff mc_int VG |
		  vg mc_idf aff mc_float VG |
;


LISTEDEC: var mc_idf VG pvg LISTEDEC |
const_int mc_idf aff mc_int VGCONST pvg LISTEDEC |
const_float mc_idf aff mc_float VGCONST pvg LISTEDEC |

;





CONST: mc_float|mc_int|mc_bool|mc_idf
;

EXPARITH:CONST mc_op EXPARITH |
 CONST  
;

AFFEC:mc_idf aff EXPARITH pvg   
;


AFFECOND:mc_idf aff EXPARITH 

LIST_INST: AFFEC LIST_INST |
mc_if arc CONDITION farc debut LIST_INST fin LIST_INST |
mc_for arc AFFECOND vg CONDITION vg Compteur farc debut LIST_INST fin LIST_INST |
comment LIST_INST |
;
CONDITION:CONST mc_rat CONST |
 mc_bool |
 EXPARITH mc_rat EXPARITH
;
Compteur:mc_idf incr| mc_idf decr
;
%%

int yyerror(char *msg) {
	printf("yyerror : %s\n",msg);
	return 0;
}

int main() {
	yyparse();
	return 0;
}

int yywrap(){}



