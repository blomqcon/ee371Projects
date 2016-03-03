#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>

#include "data_structures_constants.h"
#include "sram.h"
#include "display.h"
#include "gamelogic.h"
#include "sram_tests.h"


clock_t startTimer;

int main()
{
    //FOR NIOS
	//fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

    //Tests
    //sram_malloc_test();
    //sram_free_test();

    //Game Init
    initializeGame(startTimer);
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

        if((gameTime % 5 == 0) && updateToggle) {
            int shift = (gameTime / 20) % 8;
            updateDisplay(pSramAliens, gunnerX, gameTime % 2, shift);
            updateToggle = 0;
        }

        if((gameTime % 40 == 0) && gunnerToggle) {
            gunnerX--;
            if(gunnerX >= SCREEN_WIDTH) {
                gunnerX = 0;
            } else if(gunnerX <= 0) {
                gunnerX = SCREEN_WIDTH-1;
            }
            gunnerToggle = 0;
        }
    }

    return 0;
}
