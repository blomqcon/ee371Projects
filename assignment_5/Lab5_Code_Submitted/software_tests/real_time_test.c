#include "sys/alt_stdio.h"
#include "drivers/inc/altera_avalon_pio_regs.h"
#include "fcntl.h"
#include "unistd.h"
#include "sys/alt_stdio.h"

int main()
{ 
  alt_putstr("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

	char* xString = calloc(20, sizeof(char));
	int i;
	for(i = 0; i < 20; i++) {
		int j;
		for(j = 0; j < 20; j++) {
			if(i == j) {
				xString[j] = 0x58;
			} else {
				xString[j] = 0x20;
			}
		}
		//system("clear");
		//printf("\033c");
		alt_putstr("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		/*printf("\033[2J");
		alt_putstr("\033[2J");
		alt_putstr("\033c");
		printf("\033c");
		system("clear");*/
		/*alt_putstr("[2J");
		alt_putstr("\033c[2J");
		alt_putstr("\033");*/
		//alt_putstr("\[2J");
		printf("%s", xString);
		usleep(500000);
	}
	
	
	//Event loop, never exits
	while(1);

  return 0;
}
