#include "sys/alt_stdio.h"

#define switches (volatile char *) 0x0002000
#define leds (volatile char *) 0x0002010

int main()
{ 
  alt_putstr("Hello from Nios II!\n");

  printf("Enter 'G' to continue: ");
  char c = alt_getchar();
  while ('G' != c)
	  c=alt_getchar();

  while (1) {
	  if((*switches) & (0x01)) {
		  *leds = (~(*switches)) | ((*switches) & (0x01)) ;
	  } else {
		  *leds = *switches;
	  }
  }

  return 0;
}
