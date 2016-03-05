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
#include <altera_avalon_pio_regs.h>
#include <time.h>
#include <unistd.h>

#define leds (volatile char *) 		 0x2040
#define enable (volatile char *)  	 0x2020
#define address (volatile char *)  	 0x2010
#define data (volatile char *) 		 0x2000
#define readWrite (volatile char *)  0x2030


 int main() {
	int input = 'A';
	int i;

	while (input != 'E') {
		alt_putstr("\n");
		alt_putstr("\nTo READ type 'R' and press enter.\n");
		alt_putstr("\nTo WRITE type 'W' and press enter.\n");
		alt_putstr("\nTo exit the program, enter 'E'\n");
		input = alt_getchar();

		if (input == 'R') {
			*enable = 0x0;
			*readWrite = 0x1; // read
			for (i = 0; i < 128; i++) {
				IOWR_ALTERA_AVALON_PIO_DIRECTION(*data, 0xFF);
				(*address) = i;
				*leds = *data;
				alt_printf("%x \n", *data);
				usleep(1000);
			}
			input = 'A';
			alt_printf("Read complete\n");

		} else if (input == 'W') {
			*enable = 0x0;
			*readWrite = 0x0; // write
			IOWR_ALTERA_AVALON_PIO_DIRECTION(*data, 0x00000000);

			for (i = 0; i < 128; i++) {
				*address = i;
				*data = 0x00000000;
				*data = 127 - i;
				alt_printf("%x\n", *data);
			}
			input = 'A';
		}
	}

	return 0;
}
