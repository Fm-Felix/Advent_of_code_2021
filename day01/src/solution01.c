#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 80


int main(int argc, char *argv[])
{
    int input[4096];
    int tmp;
    int i = 0;

    while (scanf("%d", &tmp) != EOF) 
    {
        input[i] = tmp;
        i++;
    }

    int c = 0;
    for (int i = 0; i < (sizeof(input) / sizeof(input[0]) - 1); i++)
    {
        if (input[i] < input[i + 1])
            c++;
    }
    
    printf("%d\n", c);
    
    return 0;
}
