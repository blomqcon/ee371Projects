#include "sys/alt_stdio.h"
#include "drivers/inc/altera_avalon_pio_regs.h"
#include "fcntl.h"
#include "unistd.h"
#define BUFFER_SIZE 50

#define transmit_enable (volatile char *) 0x00003040
#define character_sent (volatile char *) 0x00003050
#define data_bus_output (volatile char *) 0x00003070
#define load (volatile char *) 0x00003060
#define data_bus_input (volatile char *) 0x000030a0
#define character_received (volatile char *) 0x00003090
#define data_bus_LEDs (volatile char *) 0x00003080


char readBuffer(char** pTransmit, char* pBufferHead, char* pBuffer) {
    //printf("%c %c %i\n", **pTransmit, 0xC8, **pTransmit == 0xC8);
    if(**pTransmit == 0x60 || **pTransmit == '\0') {
        return '\0';
    } else {
        char c = **pTransmit;
        **pTransmit = 0x60;

        if((*pTransmit - pBuffer) == (BUFFER_SIZE - 1)) {
            *pTransmit = pBuffer;
        } else {
            *pTransmit = *pTransmit + sizeof(char);
        }
        return c;
    }
}

void writeBuffer(char c, char** pBufferHead, char** pBuffer) {
    if(!(**pBufferHead == 0x60 || **pBufferHead == '\0')) return;

    *(*pBufferHead) = c;
    if((*pBufferHead - *pBuffer) == (BUFFER_SIZE - 1)) {
        *pBufferHead = *pBuffer;
    } else {
        *pBufferHead = *pBufferHead + sizeof(char);
    }
}

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

void readKeyboardToBuffer(char** pBufferHead, char** pBuffer) {
	char newC = alt_getchar();
	if(newC > 31 && newC < 128) {
		writeBuffer(newC, pBufferHead, pBuffer);
	}
}

void transmitIfBufferNotEmpty(char** pTransmit, char* pBufferHead, char* pBuffer, int* write) {
	if(*load) {
		  *load = 0;
	  }

	  char c = '\0';
	  if(*write) {
		  c = readBuffer(pTransmit, pBufferHead, pBuffer);
		  if(c != '\0' && c != 0x60 ) {
			  alt_putstr("writing: ");
			  alt_putchar(c);
			  alt_putstr("\n");
			  *write = 0;
			  *data_bus_output = c;
			  usleep(1000);
			  *load = 1;
			  *transmit_enable = 1;
			  //alt_putchar(c);
			  *data_bus_LEDs = (*load) | (*transmit_enable << 1) | (*character_sent << 2) | (*character_received << 3);
			  //*data_bus_LEDs = c;
			  usleep(500);
		  }
	  }
	  if(*character_sent) {
		  alt_putstr("char sent\n");
		  *write = 1;
		  *transmit_enable = 0;
	  }
}

void printIfCharacterReceive(int* read) {
	if(*character_received & *read) {
		*read = 0;
		char cRec = (*data_bus_input >> 1) & 0b0011111111;
		char parityBit = getParityBit(cRec);
		char calcParityBit = isEvenParity(cRec);
		if(parityBit == calcParityBit) {
			alt_putchar(cRec);
		}
	} else if(!(*character_received)) {
		*read = 1;
	}
}


int main() {
	fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

	alt_putstr("EE 371 Lab 4 - Adding Communication\n");
	int read = 1;
	int write = 1;

	char* pBuffer = calloc(BUFFER_SIZE, sizeof(char));
	char* pBufferHead = pBuffer;
	char* pTransmit = pBuffer;

	*load = 0;
	*transmit_enable = 0;
	*data_bus_output = 0xFF;
	*data_bus_LEDs = 0x00;

  /* Event loop never exits. */
  while (1) {
	  //*******read keyboard and put characters in buffer********
	  /*readKeyboardToBuffer(&pBufferHead, &pBuffer);

	  //******transmit*******
	  transmitIfBufferNotEmpty(&pTransmit, pBufferHead, pBuffer, &write);

	  //*****receive*********
	  printIfCharacterReceive(&read);

	  //******Debug outputs
	  *data_bus_LEDs = (*load) | (*transmit_enable << 1) | (*character_sent << 2) | (*character_received << 3);
	  //*data_bus_LEDs = 0xFF;*/
  }

  return 0;
}



