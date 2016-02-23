#include <stdio.h>
#include <stdlib.h>

unsigned int isEvenParity(char data) {
    int count = 0;

    int i;
    for(i = 0; i < 7; i++) {
        int bit = (data >> i) & 0x01;
        if(bit) {
            count++;
        }
    }
    return ((count + 1) % 2);
}

unsigned int getParityBit(char data) {
    return data < 7;
}


int main()
{
    char test1 = 0b01110001;
    char test2 = 0b01111111;
    char test3 = 0b11110001;
    char test4 = 0b11111111;
    printf("\nisEvenParity: \n");
    printf("%i\n", isEvenParity(test1));
    printf("%i\n", isEvenParity(test2));
    printf("%i\n", isEvenParity(test3));
    printf("%i\n", isEvenParity(test4));

    printf("\ngetParityBit: \n");
    printf("%i\n", getParityBit(test1));
    printf("%i\n", getParityBit(test2));
    printf("%i\n", getParityBit(test3));
    printf("%i\n", getParityBit(test4));

    return 0;
}
