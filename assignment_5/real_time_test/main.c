#include <stdio.h>
#include <stdlib.h>

int main()
{
    char* xString = calloc(20, sizeof(char));
    int i;
    for(i = 0; i < 20; i++) {
        int j;
        for(j = 0; j < 20; j++) {
            if(i == j) {
                xString[j] = 0x58;
            } else {
                xString[j] = 0x20;
            }
        }
        system("cls");
        printf("%s\n", xString);
        usleep(500000);
    }


    return 0;
}
