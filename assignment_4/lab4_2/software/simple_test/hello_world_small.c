#include "sys/alt_stdio.h"
#include "drivers/inc/altera_avalon_pio_regs.h"
#include "fcntl.h"
#include "unistd.h"
#define BUFFER_SIZE 50

#define transmit_enable 	(volatile char *) 0x00005000
#define character_sent 		(volatile char *) 0x00005010
#define data_bus_output 	(volatile char *) 0x00005030
#define load 				(volatile char *) 0x00005020
#define data_bus_input 		(volatile char *) 0x00005060
#define character_received 	(volatile char *) 0x00005050
#define data_bus_LEDs 		(volatile char *) 0x00005040


int main() {
	alt_putstr("here\n");

	while(!(*character_received)) {

	}
	alt_putchar(*data_bus_input);

}
