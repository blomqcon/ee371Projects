#include "sys/alt_stdio.h"

#define transmit_enable (volatile char *) 0x2000
#define character_sent (volatile char *) 0x2010
#define data_bus_output (volatile char *) 0x2030
#define load (volatile char *) 0x2020
#define data_bus_input (volatile char *) 0x2060
#define character_received (volatile char *) 0x2050
#define data_bus_LEDs (volatile char *) 0x2040

int main()
{
  alt_putstr("EE 371 Lab 4 - Adding Communication\n");
  int read = 1;
  int write = 1;

  /* Event loop never exits. */
  while (1) {
	  if(character_received & read) {
		  read = 0;
		  alt_ptrstr(data_bus_input);
	  } else if(!character_received) {
		  read = 1;
	  }

	  if(transmit_enable & load & write) {
		  write = 0;
		  data_bus_output = data_bus_output & 0b01111111;
		  //data_bus_output = data_bus_output + '0';
		  alt_ptrstr(data_bus_output + "\n");
		  character_sent = 1;
	  } else if(!transmit_enable) {
		  write = 1;
		  character_sent = 0;
	  }
  }

  return 0;
}
