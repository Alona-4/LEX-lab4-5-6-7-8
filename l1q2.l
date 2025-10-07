%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void digi(); 
int op = 0, i;
float a, b;
%}

dig [0-9]+(\.[0-9]+)?

add "+"
sub "-"
mul "*"
div "/"
pow "^"

%%

{dig}   { digi(); }
{add}   { op = 1; }
{sub}   { op = 2; }
{mul}   { op = 3; }
{div}   { op = 4; }
{pow}   { op = 5; }
\n      { printf("\n The Answer : %f\n\n", a); }
[ \t]+  /* ignore whitespace */

%%

void digi()
{
    if(op == 0)
        a = atof(yytext);
    else
    {
        b = atof(yytext);

        switch(op)
        {
            case 1: a = a + b; break;
            case 2: a = a - b; break;
            case 3: a = a * b; break;
            case 4: a = a / b; break;
            case 5: a = pow(a, b); break;
        }
        op = 0;
    }
}

int main(int argc, char *argv[])
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

