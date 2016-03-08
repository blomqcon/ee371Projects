
#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"
#include "unistd.h"
#include "fcntl.h"
//IOWR_ALTERA_AVALON_PIO_DATA(targetAddress, aValue);
//aValue = IOWR_ALTERA_AVALON_PIO_DATA(sourceAddress);
#define transmit_enable (volatile char *) 0x000050c0
#define character_sent (volatile char *) 0x000050d0
#define data_bus_output (volatile unsigned char *) 0x000050f0
#define load (volatile char *) 0x000050e0
#define data_bus_input (volatile unsigned char *) 0x00005120
#define character_received (volatile char *) 0x00005110
#define data_bus_LEDs (volatile char *) 0x00005100

unsigned int setParity(unsigned int c);
unsigned int getParity(unsigned int c);
unsigned int getCharacter(unsigned int c);
unsigned int getBits(unsigned int c);

int main()
{ 
	alt_putstr("Hello from Nios II!\n");
		*character_received = 0;
		char *msg = "Hello from a different Nios II!";
		int j;
		unsigned char incoming;
		while (1) {
			//msg = fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

			if (*character_received) {
				incoming = getCharacter(*data_bus_input);
				alt_printf("Incoming: %c \n", incoming);

				while(*character_received) {
				}
			}
	}

	return 0;
}

unsigned int setParity(unsigned int c) {
	int parity = c;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;

	//alt_putchar(c);
	int out = ((c  << 1));
	//out ^= (parity & 1) << 7;
	//out ^= 1 << (parity & 1);
	if (parity & 1) {
		out ^= 1 >> 7;
	}
	return out;
}

unsigned int getParity(unsigned int c) {
	int parity = c;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;
	return parity & 1;
}

unsigned int getCharacter(unsigned int c) {
	return ((c >> 0));
}

unsigned int getBits(unsigned int c) {
	/*alt_printf("Bit 0: %x \n", (c >> 0) & 0b00000001);
	alt_printf("Bit 1: %x \n", (c >> 1) & 0b00000001);
	alt_printf("Bit 2: %x \n", (c >> 2) & 0b00000001);
	alt_printf("Bit 3: %x \n", (c >> 3) & 0b00000001);
	alt_printf("Bit 4: %x \n", (c >> 4) & 0b00000001);
	alt_printf("Bit 5: %x \n", (c >> 5) & 0b00000001);
	alt_printf("Bit 6: %x \n", (c >> 6) & 0b00000001);
	alt_printf("Bit 7: %x \n", (c >> 7) & 0b00000001);
	*/
	alt_printf("%x%x%x%x%x%x%x%x\n",
			(c >> 7) & 0b00000001,
			(c >> 6) & 0b00000001,
			(c >> 5) & 0b00000001,
			(c >> 4) & 0b00000001,
			(c >> 3) & 0b00000001,
			(c >> 2) & 0b00000001,
			(c >> 1) & 0b00000001,
			(c >> 0) & 0b00000001);
}

