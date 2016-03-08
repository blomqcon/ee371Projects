/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"
#include "unistd.h"
//IOWR_ALTERA_AVALON_PIO_DATA(targetAddress, aValue);
//aValue = IOWR_ALTERA_AVALON_PIO_DATA(sourceAddress);
#define parallel_out (volatile char *) 0x0003050
#define parallel_in (volatile char *) 0x0003040
#define char_received (volatile char *) 0x0003030
#define char_sent (volatile char *) 0x0003020
#define transmit_enable (volatile char *) 0x0003010
#define load (volatile char *) 0x0003000


int main()
{ 
	alt_putstr("Hello from Nios II!\n");
	alt_putstr("Input the char you would like to send.\n");
	alt_putchar(*parallel_in);
	alt_putstr("\n");
	int c = alt_getchar();
	alt_putstr("\n");

	*transmit_enable = 0x0;
	*load = 0x0;
	*parallel_out = c;
	usleep(1000);
	*transmit_enable = 0x1;
	*load = 0x1;
	usleep(50);
	*load = 0x0;

	while (!*char_sent) {
	}
	*transmit_enable = 0x0;

	while (!*char_received) {
	}

	alt_putchar(*parallel_in);
	alt_putstr("\n");

	return 0;
}











/*
int setParity(int c);
int getParity(int);
int getCharacter(int);

int main()
{
	alt_putstr("Hello from Nios II!\n");

	*transmit_enable = 0x0;
	*load = 0x0;
	*parallel_out = setParity(139);
/*	int parity = 139;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;


	int out = 139 >> 1;
	out ^= 1 << (parity & 1);

	*parallel_out = out;

	alt_putchar(139);
	alt_putchar(*parallel_out);
	usleep(1000);
	*transmit_enable = 0x1;
	*load = 0x1;
	usleep(50);
	*load = 0x0;

	while (!*char_sent) {
	}
	*transmit_enable = 0x0;

	while (!*char_received) {
	}
	//alt_putchar(getParity(*parallel_out));
	//alt_putchar(getCharacter(*parallel_out));
	alt_putchar(*parallel_out);
	for(int i=0;i<8;++i){
	    // print last bit and shift left.
	    printf("%u ",num&maxPow ? 1 : 0);
	    num = num<<1;
	}

	return 0;
}

int setParity(int c) {
	int parity = c;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;


	int out = c  >> 1;
	out ^= 1 << (parity & 1);
	return out;
}

int getParity(int c) {
	int parity = c;
	parity ^= parity >> 4;
	parity ^= parity >> 2;
	parity ^= parity >> 1;
	return parity & 1;
}

int getCharacter(int c) {
	return c >> 1;
}*/


