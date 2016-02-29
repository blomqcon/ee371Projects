#include "sys/alt_stdio.h"
#define BUFFER_SIZE 50

#define transmit_enable (volatile char *) 0x00005000
#define character_sent (volatile char *) 0x00005010
#define data_bus_output (volatile char *) 0x00005030
#define load (volatile char *) 0x00005020
#define data_bus_input (volatile char *) 0x00005060
#define character_received (volatile char *) 0x00005050
#define data_bus_LEDs (volatile char *) 0x00005040


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


int main()
{
	alt_putstr("EE 371 Lab 4 - Adding Communication\n");
	int read = 1;
	int write = 1;
	//int load_toggle = 1;

	char *pBuffer = calloc(BUFFER_SIZE, sizeof(char));
	char* pBufferHead = pBuffer;
	char* pTransmit = pBuffer;



	*load = 0;
	*transmit_enable = 0;
	*data_bus_output = 0x00;
	*data_bus_LEDs = 0b01010101;

  /* Event loop never exits. */
  while (1) {
	  writeBuffer(alt_getchar(), &pBufferHead, &pBuffer);

	  //transmit
	  char c = readBuffer(&pTransmit, pBufferHead, pBuffer);
	  if(load) {
		  *load = 0;
	  }

	  if(c != '\0' && write) {
		  write = 0;
		  *transmit_enable = 1;
		  *data_bus_output = c;
		  *load = 1;
	  }

	  if(character_sent) {
		  write = 1;
		  *transmit_enable = 0;
	  }

	  //receive
	  if(*character_received & read) {
		  read = 0;
		  int parity = *data_bus_input & 0x01;

		  alt_putstr((*data_bus_input) >> 1);
	  } else if(!(*character_received)) {
		  read = 1;
	  }
  }

  return 0;
}



