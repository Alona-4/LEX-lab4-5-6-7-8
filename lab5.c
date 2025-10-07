#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main() {
    int x = 0, n, i = 0, j = 0;
    void *mypointer, *addressArray[15];  // Increased size for safety
    char ch, inputArray[15], symbolArray[15];
    char c;

    printf("Input the expression ending with $ sign: ");
    while ((c = getchar()) != '$' && i < 15) {
        inputArray[i++] = c;
    }
    n = i - 1;

    printf("Given Expression: ");
    for (i = 0; i <= n; i++) {
        printf("%c", inputArray[i]);
    }
    printf("\n");

    printf("Symbol Table display\n");
    printf("Symbol \t Address \t Type\n");

    j = 0;
    x = 0;
    while (j <= n) {
        c = inputArray[j];

        if (isalpha(c)) {
            // Allocate 1 byte for identifier (just demonstration)
            mypointer = malloc(sizeof(char));
            if (!mypointer) {
                fprintf(stderr, "Memory allocation failed\n");
                return 1;
            }
            addressArray[x] = mypointer;
            symbolArray[x] = c;

            printf("%c \t %p \t identifier\n", c, mypointer);

            x++;
            j++;
        } 
        else if (c == '+' || c == '-' || c == '*' || c == '=') {
            mypointer = malloc(sizeof(char));
            if (!mypointer) {
                fprintf(stderr, "Memory allocation failed\n");
                return 1;
            }
            addressArray[x] = mypointer;
            symbolArray[x] = c;

            printf("%c \t %p \t operator\n", c, mypointer);

            x++;
            j++;
        }
        else {
            // If you want to handle spaces or other symbols, skip or handle here
            j++;
        }
    }

    // Free allocated memory
    for (i = 0; i < x; i++) {
        free(addressArray[i]);
    }

    return 0;
}

