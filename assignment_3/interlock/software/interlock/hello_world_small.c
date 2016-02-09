
#include "sys/alt_stdio.h"

#define switches (volatile char *) 0x0002000
#define interlock_outputs (volatile char *) 0x0002010

void printCurrentState() {
	if(*interlock_outputs & 0b00000001) {
		alt_putstr("Arriving\n");
	} else if(*interlock_outputs & 0b00000010) {
		alt_putstr("Departing\n");
	}

	if(*interlock_outputs & 0b00000100) {
		alt_putstr("Doors: Inner Door Open\n");
	} else if(*interlock_outputs & 0b00001000) {
		alt_putstr("Doors: Outer Door Open\n");
	} else {
		alt_putstr("Doors: Doors closed\n");
	}

	if(*interlock_outputs & 0b00010000) {
		alt_putstr("Chamber: Pressurized\n");
	} else if(*interlock_outputs & 0b00100000) {
		alt_putstr("Chamber: Evacuated\n");
	} else {
		alt_putstr("Chamber: Neither\n");
	}
}

int main()
{ 
  alt_putstr("Hello from Nios II!\n");

  printf("Enter 'G' to continue: ");
  char c = alt_getchar();
  while ('G' != c)
	  c=alt_getchar();

  while (1) {
	  /*if((*switches) & (0x01)) {
		  *leds = (~(*switches)) | ((*switches) & (0x01)) ;
	  } else {
		  *leds = *switches;
	  }*/
  }

  return 0;
}
