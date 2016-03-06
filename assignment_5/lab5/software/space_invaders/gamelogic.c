#include <time.h>

#include "gamelogic.h"
#include "data_structures_constants.h"
#include "sram.h"

void initializeGame(clock_t startTimer) {
    resetSRAM();
    srand(time(NULL)); //Seed random number generator
    startTimer = clock();
}

void updateGameTime(int* gameTime, clock_t* startTimer) {
    float seconds = ((float)(clock() - (*startTimer)))/CLOCKS_PER_SEC;
    if(seconds > 0.1) {
        (*gameTime)++;
        *startTimer = clock();
    }
}

void updateToggleValues(int gameTime, int* updateToggle, int* gunnerToggle) {
    if(gameTime % 41 == 0) {
        *updateToggle = 1;
    }

    if(gameTime % 41 == 0) {
        *gunnerToggle = 1;
    }
}
