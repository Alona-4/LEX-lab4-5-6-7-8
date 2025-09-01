%{
int yylex();
%}
%{
#define YYSTYPE double
#include <ctype.h>
#include <stdio.h>
%}
%token NUMBER
%left'+''-'
%left'*''/'
%right UMINUS
%%
lines:lines expr'\n'
{
printf("%g\n",$2);
}
|lines'\n'
|/*E*/
;
expr:expr'+'expr{$$=$1+$3;}
|expr'-'expr{$$=$1-$3;}
|expr'/'expr{$$=$1/$3;}
|'('expr')'{$$=$2;}
|'-'expr%prec UMINUS{$$=-$2;}
|NUMBER
;
%%
yylex()
{
int c;
while((c=getchar())==' ');
if((c=='.') || (isdigit(c)))
16
;{
ungetc(c,stdin);
scanf("%lf",&yylval);
return NUMBER;
}
return c;
}
int main()
{
yyparse();
return 1; }
int yyerror()
{
return 1;}
int yywrap()
{
return 1; }

