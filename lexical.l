%{
#include "syntaxique.h"
%}

chiffre[0-9]

vide [ \t\n]+
idf [A-Z]([_]?[a-z0-9])*
int [+-]?([1-9][0-9]*|0)
float [-+]?([1-9][0-9]*|0)\.([0-9]*[1-9])
bool "TRUE"|"true"|"FALSE"|"false"
vartype "int"|"float"|"bool"
const_int "const int"
const_float "const float"
op "*"|"+"|"-"|"/"|"%"
rat "<"|"<="|"<>"|"=="|">"|">="|"!="
incr "++"
decr "--"
arc "("
farc ")"
aff "="	
vg ","
pvg ";"
debut "{"
fin "}"
if "if"
for "for"
begin "begin"
end "end"
comment "{"[^}]*"}"

%%
{comment} return comment;
{const_float} return const_float;
{const_int} return const_int;
{vide}
{begin} return mc_begin;
{end} return mc_end;

{vartype} return var;
{float} return mc_float;
{bool} return mc_bool;
{int} return mc_int;
{idf} return mc_idf;
{if} return mc_if;
{for} return mc_for;
{rat} return mc_rat;
{op} return mc_op;
{pvg} return pvg;
{vg} return vg;
{arc} return arc;
{farc} return farc;
{debut} return debut;
{fin} return fin;
{incr} return incr;
{decr} return decr;
{aff} return aff;
.
%%