#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "fcntl.h"
#include "unistd.h"
#include "sys/alt_stdio.h"
#include "communication.h"
#include "altera_avalon_pio_regs.h"
#include "altera_nios2_qsys_irq.h"
#include "sys/alt_irq.h"

#include "data_structures_constants.h"


void* edge_capture_gun;
void* edge_capture_receive;
void* edge_capture_sent;



char readBuffer() {
    if(*pTransmit == 0x60 || *pTransmit == '\0') {
        return '\0';
    } else {
        char c = *pTransmit;
        *pTransmit = 0x60;

        if((pTransmit - pBuffer) == (TRANSMIT_BUFFER_SIZE - 1)) {
            pTransmit = pBuffer;
        } else {
            pTransmit = pTransmit + sizeof(char);
        }
        return c;
    }
}

void writeBuffer(char c) {
    if(!(*pBufferHead == 0x60 || *pBufferHead == '\0')) return;

    *(pBufferHead) = c;
    if((pBufferHead - pBuffer) == (TRANSMIT_BUFFER_SIZE - 1)) {
        pBufferHead = pBuffer;
    } else {
        pBufferHead = pBufferHead + sizeof(char);
    }
}


void transmitIfBufferNotEmpty() {
	  char c = '\0';
	  c = readBuffer();
	  if(c != '\0' && c != 0x60 ) {
		*transmit_enable = 0x0;
		*load = 0x0;
		
		*data_bus_output = (c);
		*data_bus_output = setParity(*data_bus_output);
		
		usleep(1000);
		*transmit_enable = 0x1;
		*load = 0x1;
		usleep(50);
		*load = 0x0;
	  }
}


void gun_handler(void* context) {
	printf("gun!\n");

	volatile int* edge_capture_gun_ptr = (volatile int*) context; //volatile variable to avoid optimization...
	*edge_capture_gun_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(GUN_LEFT_BASE); //Store edge capture register in *context.
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(GUN_LEFT_BASE, 0x0); //Reset edge capture register
}

void character_recieved_handler(void* context) {
	alt_putchar(getCharacter(*data_bus_input));
	
	volatile int* edge_capture_receive_ptr = (volatile int*) context; //volatile variable to avoid optimization...
	*edge_capture_receive_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(CHARACTER_RECIEVED_INPUT_BASE); //Store edge capture register in *context.
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(CHARACTER_RECIEVED_INPUT_BASE, 0x0); //Reset edge capture register
}

void character_sent_handler(void* context) {
	*transmit_enable = 0x0;
	transmitIfBufferNotEmpty();

	volatile int* edge_capture_sent_ptr = (volatile int*) context; //volatile variable to avoid optimization...
	*edge_capture_sent_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(CHARACTER_SENT_INPUT_BASE); //Store edge capture register in *context.
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(CHARACTER_SENT_INPUT_BASE, 0x0); //Reset edge capture register
}

void setup_interrupt() {
	void* edge_capture_gun_ptr = (void*) &edge_capture_gun; //volatile variable to avoid optimization
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(GUN_LEFT_BASE, 0x1); //Enable first  button interrupts.
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(GUN_LEFT_BASE, 0x0); //Reset the edge capture register.
	alt_ic_isr_register(GUN_LEFT_IRQ_INTERRUPT_CONTROLLER_ID, GUN_LEFT_IRQ, gun_handler, edge_capture_gun_ptr, 0x0); //Sets the interrupt handler

	void* edge_capture_receive_ptr = (void*) &edge_capture_receive; //volatile variable to avoid optimization
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(CHARACTER_RECIEVED_INPUT_BASE, 0x1); //Enable first  button interrupts.
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(CHARACTER_RECIEVED_INPUT_BASE, 0x0); //Reset the edge capture register.
	alt_ic_isr_register(CHARACTER_RECIEVED_INPUT_IRQ_INTERRUPT_CONTROLLER_ID, CHARACTER_RECIEVED_INPUT_IRQ, character_recieved_handler, edge_capture_receive_ptr, 0x0); //Sets the interrupt handler
	
	void* edge_capture_sent_ptr = (void*) &edge_capture_sent; //volatile variable to avoid optimization
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(CHARACTER_SENT_INPUT_BASE, 0x1); //Enable first  button interrupts.
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(CHARACTER_SENT_INPUT_BASE, 0x0); //Reset the edge capture register.
	alt_ic_isr_register(CHARACTER_SENT_INPUT_IRQ_INTERRUPT_CONTROLLER_ID, CHARACTER_SENT_INPUT_IRQ, character_sent_handler, edge_capture_sent_ptr, 0x0); //Sets the interrupt handler
}

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
	return ((c >> 1));
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
