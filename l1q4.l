%{
int digit_count = 0;
%}

%%
[0-9]    { digit_count++; }
.|\n     { /* ignore other characters */ }
%%

int main() {
    yylex();
    printf("Total digits: %d\n", digit_count);
    return 0;
}

