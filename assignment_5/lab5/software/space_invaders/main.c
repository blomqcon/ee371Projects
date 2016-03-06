
#include "sys/alt_stdio.h"
#include "drivers/inc/altera_avalon_pio_regs.h"
#include <time.h>

#include "data_structures_constants.h"
#include "sram.h"
#include "display.h"
#include "gamelogic.h"


/*#define gun_left (volatile char *) 0x00005020
#define gun_right (volatile char *) 0x00005010
#define gun_shoot (volatile char *) 0x00005000*/


/*#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>*/




clock_t startTimer;

int main()
{
    //FOR NIOS
	//fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);
	alt_putstr("Game Start!\n");
	//system("clear");
	printf("\x1B[2J");
	printf("\x1B[2J");
	alt_putstr("\033[2J");
	printf("%c[2J", 27);
	printf("\e[1;1H\e[2J");
	alt_putchar('\033c');
	alt_putchar('\033');
    
	//Tests
    //sram_malloc_test();
    //sram_free_test();

    //Game Init
	/*initializeGame(startTimer);
    int pSramAliens = sram_malloc(sizeof(struct Alien) * (ALIEN_COLS * ALIEN_ROWS));

    //New Game
    int gameTime = 0;
    int gunnerX = 5;
    initRandomAliens(pSramAliens);
    int updateToggle = 1;
    int gunnerToggle = 1;

    //Game Event Loop
    while(1) {
        updateGameTime(&gameTime, &startTimer);
        updateToggleValues(gameTime, &updateToggle, &gunnerToggle);

        if((gameTime % 40 == 0) && updateToggle) {
            int shift = (gameTime / 20) % 8;
            updateDisplay(pSramAliens, gunnerX, gameTime % 2, shift);
            updateToggle = 0;
        }
    }*/

    return 0;
}
