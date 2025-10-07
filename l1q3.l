%{
int vowels = 0;
%}

%%
[aeiouAEIOU] { vowels++; }
\n          { printf("Vowels so far: %d\n", vowels); }
.           { /* ignore other characters */ }
%%

int main() {
    yylex();
    printf("Total vowels: %d\n", vowels);
    return 0;
}

