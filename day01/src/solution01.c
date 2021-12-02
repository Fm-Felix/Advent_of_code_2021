#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 80


int main(int argc, char *argv[])
{
    int input[2000];
    int tmp;
    int i = 0;

    while (scanf("%d", &tmp) != EOF) 
    {
        input[i] = tmp;
        i++;
    }

    int c = 0;

    for (int i = 0; i < (sizeof(input) / sizeof(input[0]) - 3); i++)
    {
        if ((input[i] + input[i + 1] + input[i + 2]) < (input[i + 1] + input[i + 2] + input[i + 3]))
            c++;
    }
    
    printf("%d\n", c);
    
    return 0;
}
