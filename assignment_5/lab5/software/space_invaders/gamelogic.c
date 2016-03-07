#include <time.h>

#include "gamelogic.h"
#include "data_structures_constants.h"
#include "sram.h"

void initializeGame(clock_t startTimer) {
    //resetSRAM();
    //srand(time(NULL)); //Seed random number generator
    startTimer = clock();
}


int gunnerLeftToggle = 1;
void moveGunnerLeft(int* gunnerX) {
	if((*gun_left) && gunnerLeftToggle) {
		gunnerLeftToggle = 0;
		if((*gunnerX) == 0) {
			(*gunnerX) = (ALIEN_WIDTH * ALIEN_COLS) - 1;
		} else {
			(*gunnerX)--;
		}		
	} else if (!(*gun_left) && !(gunnerLeftToggle)) {
		gunnerLeftToggle = 1;
	}
}

int gunnerRightToggle = 1;
void moveGunnerRight(int* gunnerX) {	
	if((*gun_right) && gunnerRightToggle) {
		gunnerRightToggle = 0;
		if((*gunnerX) == (ALIEN_WIDTH * ALIEN_COLS) - 1) {
			(*gunnerX) = 0;
		} else {
			(*gunnerX)++;
		}		
	} else if (!(*gun_right) && !(gunnerRightToggle)) {
		gunnerRightToggle = 1;
	}
}


int gunnerShootToggle = 1;
void shootGunner(int* gunnerX) {
	if((*gun_shoot) && gunnerShootToggle) {
		gunnerShootToggle = 0;
		struct Projectile proj;
		proj.xVal = ((*gunnerX) + (GUNNER_WIDTH/2)) % (ALIEN_COLS * ALIEN_WIDTH);
		proj.yVal = 0;
		proj.direction = 1;
		proj.symbol = '^';
		proj.type = 1;
		proj.timeTick = 0;
		
		checkCollideAliens(pSramAliens, 2);
		//addProjectileNode(proj);
	} else if (!(*gun_shoot) && !(gunnerShootToggle)) {
		gunnerShootToggle = 1;
	}
}


int alienShootToggle = 1;
void shootAliens() {
	if((*gun_shoot) && alienShootToggle) {
		alienShootToggle = 0;
		printf("X, Y: %i, %i\n", (*alien_x), (*alien_y));
	} else if (!(*gun_shoot) && !(alienShootToggle)) {
		alienShootToggle = 1;
	}
}

void checkCollideAliens(int pSramAliens, int x) {
	int y;
	for(y = ALIEN_ROWS - 1; y >= 0; y--) {
		struct Alien a = getAlien(pSramAliens, y, (x + (7-alienShift)) % ALIEN_COLS);
		if(a.alive) {
			printf("KILL (%i, %i)\n", (x + (7-alienShift)) % ALIEN_COLS, y);
			a.alive = 0;
			setAlien(pSramAliens, y, (x + (7-alienShift)) % ALIEN_COLS, a);
			break;
		}
	}
}

int checkCollideGunner(int gunnerX, int projX, int projY, int* gameOver) {
    if (projX == gunnerX && projY == gunnerX) {
        *gameOver = 1;
        return 1;
    } else {
        return 0;
    }
}
