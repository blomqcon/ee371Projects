#include "sys/alt_stdio.h"

#define transmit_enable (volatile char *) 0x00000001
#define character_sent (volatile char *) 0x00000002
#define data_bus_output (volatile char *) 0x00000003
#define load (volatile char *) 0x00000004
#define data_bus_input (volatile char *) 0x00000005
#define character_received (volatile char *) 0x00000006
#define data_bus_LEDs (volatile char *) 0x00000007

int main()
{
  alt_putstr("Hello from Nios II!\n");
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
