// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// File name: 
//	SRAM.c
//
// Description:
//	Implements the C-coded user interface console for use with Altera's NIOS II
//	Eclipse environment. Interacts with NIOS II processor with the DE1_SoC board.
//
// Author:
//	Joanna Mazer, Nick Lopez
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

#include <sys/alt_stdio.h>
#include <time.h>
#include <unistd.h>

#define leds (volatile int *) 		 0x2040
#define enable (volatile int *)  	 0x2020
#define address (volatile int *)  	 0x2010
#define data (volatile int *) 		 0x2000
#define readWrite (volatile int *)  0x2030


 int main() {
	char input = 'A';
	int i;
	int j;
	while (input != 'E') {
		alt_putstr("\nTo READ type 'R' and press enter.\n");
		alt_putstr("\nTo WRITE type 'W' and press enter.\n");
		alt_putstr("\nTo exit the program, enter 'E'\n");
		input = alt_getchar();

		if (input == 'R') {
			*enable = 0;
			*readWrite = 1; // read
			for (j = 0x00; j < 0x7F; j = j + 1) {
				usleep(100000);
				(*address) = j;
				*leds = *data;
				alt_printf("%d   ", *(int*) leds);
			}
			input = 'A';
			alt_printf("Read complete\n");

		} else if (input == 'W') {
			*enable = 0;
			*readWrite = 1; // write
			*address = 0x0;
			for (i = 0x7F; i > 0x00; i = i - 1) {
				*data = i;
				*address = data;
			}
			input = 'A';
		}
	}

	return 0;
}
