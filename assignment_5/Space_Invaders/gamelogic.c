#include <time.h>

#include "gamelogic.h"
#include "data_structures_constants.h"
#include "sram.h"

void initializeGame(clock_t startTimer) {
    //resetSRAM();
    //srand(time(NULL)); //Seed random number generator
    startTimer = clock();
}

void moveGunnerLeft(int* gunnerX) {
    if((*gunnerX) == 0) {
        (*gunnerX) = (ALIEN_WIDTH * ALIEN_COLS) - 1;
    } else {
        (*gunnerX)--;
    }
}

void moveGunnerRight(int* gunnerX) {
    if((*gunnerX) == (ALIEN_WIDTH * ALIEN_COLS) - 1) {
        (*gunnerX) = 0;
    } else {
        (*gunnerX)++;
    }
}

void shootGunner(int* gunnerX) {
    struct Projectile p;
    p.direction = 1;
}

void updateGameTime(int* gameTime, clock_t* startTimer) {
    float seconds = ((float)(clock() - (*startTimer)))/CLOCKS_PER_SEC;
    if(seconds > 0.1) {
        (*gameTime)++;
        *startTimer = clock();
    }
}

void updateToggleValues(int gameTime, int* updateToggle, int* gunnerToggle) {
    if(gameTime % 11 == 0) {
        *updateToggle = 1;
    }

    if(gameTime % 21 == 0) {
        *gunnerToggle = 1;
    }
}

int checkCollideAliens(int pSramAliens, int projX, int projY) {
    int x, y;
    for (x = 0; x < ALIEN_ROWS; x++) {
        for (y = 0; y < ALIEN_COLS; y++) {
            if (projX == x && projY == y) {
                struct Alien a = getAlien(pSramAliens, x, y);
                a.alive = 0;
                setAlien(pSramAliens, x, y, a);
                return 1;
            } else {
                return 0;
            }
        }
    }
    return 0;
}

int checkCollideGunner(int gunnerX, int projX, int projY, int* gameOver) {
    if (projX == gunnerX && projY == gunnerX) {
        *gameOver = 1;
        return 1;
    } else {
        return 0;
    }
}
