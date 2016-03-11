#include <stdio.h>
#include <stdlib.h>

int setParity(unsigned int c) {
	int parity = c;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;

	int out = ((c  << 1));
	if (parity & 1) {
		out ^= 1 >> 7;
	}
	return out;
}

int getParity(unsigned int c) {
	int parity = c;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;
	return parity & 1;
}

int getCharacter(unsigned int c) {
	return ((c >> 0));
}

int getBits(unsigned int c) {
	printf("%x%x%x%x%x%x%x%x\n",
			(c >> 7) & 0b00000001,
			(c >> 6) & 0b00000001,
			(c >> 5) & 0b00000001,
			(c >> 4) & 0b00000001,
			(c >> 3) & 0b00000001,
			(c >> 2) & 0b00000001,
			(c >> 1) & 0b00000001,
			(c >> 0) & 0b00000001);
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
