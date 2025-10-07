
%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[a-z]   { putchar(toupper(yytext[0])); }
.|\n    { putchar(yytext[0]); }
%%

int main() {
    yylex();
    return 0;
}

