#include "data_structures_constants.h"
#include "sram.h"
#include "display.h"


struct Alien newAlien(char alive, char type, char id) {
    struct Alien a;
    a.alive = alive;
    a.type = type;
    a.rowId = id;
    return a;
};

void initRandomAliens(int pSramAliens) {
    int x, y;
    for(x = 0; x < 3; x++) {
        for(y = 0; y < 8; y++) {
            int type = rand() % 3;
            setAlien(pSramAliens, x, y, newAlien(1, type, y));
        }
    }
}

const char* getAlienApperence(int type) {
    if(type == 0) {
        return alien0;
    } else if(type == 1) {
        return alien1;
    } else {
        return alien2;
    }
}

void printAlienSlice(int pSramAliens, int x, int y, int slice, int step) {
    struct Alien alien = getAlien(pSramAliens, x, y);
    if(alien.alive == 1) {
        char* alienApperence = getAlienApperence(alien.type);
        int offset = step * ALIEN_WIDTH * ALIEN_HEIGHT;
        int i;
        for(i = 0; i < ALIEN_WIDTH; i++) {
            int index = offset + (slice * ALIEN_WIDTH) + i;
            if(alienApperence[index] == '0') {
                putchar(alien.rowId + 48);
            } else {
                putchar(alienApperence[index]);
            }
        }
    } else {
		int i;
		for(i = 0; i < ALIEN_WIDTH; i++) {
			//alt_putchar('-');
			alt_putchar(' ');
		}
	}
}

void printSlice(int pSramAliens, int x, int slice, int step, int shift) {
    int y;
    for(y = 0; y < ALIEN_COLS; y++) {
        //printf("real position: %i\n", (y + shift) % ALIEN_COLS);
        printAlienSlice(pSramAliens, x, (y + (7-shift)) % ALIEN_COLS, slice, step);
		//printAlienSlice(pSramAliens, x, y, slice, step);
    }
    printf("\n");
}

void printAliens(int pSramAliens, int step, int shift) {
    int x, slice;
    for(x = 0; x < ALIEN_ROWS; x++) {
        for(slice = 0; slice < ALIEN_HEIGHT; slice++) {
            printSlice(pSramAliens, x, slice, step, shift);
        }
    }
}

void printVoid(int pSramBulletBuffer) {
	updateProjectileBuffer(pSramBulletBuffer);
    	int x, y;
	for(y = VOID_HEIGHT-1; y >= 0 ; y--) {
		for(x = 0; x < (ALIEN_COLS * ALIEN_WIDTH); x++) {
			struct Projectile empty = getProjectile(pSramBulletBuffer, x, y);
			if(empty.type != 0) {
				alt_putchar(empty.symbol);
			} else {
				//alt_putchar('-');
				alt_putchar(' ');
			}
        }
		printf("\n");
    }
}

printGunnerSlice(int gunnerX, int slice) {
    int SCREEN_WIDTH = ALIEN_COLS * ALIEN_WIDTH;
    int numberOfWraps = (gunnerX + GUNNER_WIDTH) - SCREEN_WIDTH;
    if(numberOfWraps < 0) numberOfWraps = 0;

    int i;

    for(i = 0; i < numberOfWraps; i++) {
        putchar(gunner[(slice * GUNNER_WIDTH) + (GUNNER_WIDTH - numberOfWraps + i)]);
    }
    for(i = 0; i < (gunnerX - numberOfWraps); i++) {
        //putchar('-');
		putchar(' ');
    }
    for(i = 0; i < GUNNER_WIDTH - numberOfWraps; i++) {
        putchar(gunner[(slice * GUNNER_WIDTH) + i]);
    }
    //printf("numberofWraps: %i %i %i", numberOfWraps, gunnerX, gunnerX - numberOfWraps);

}

void printGunner(int gunnerX) {
    int x;
    for(x = 0; x < GUNNER_HEIGHT; x++) {
        printGunnerSlice(gunnerX, x);
        //printf("gunner!");
        printf("\n");
    }
    //printf("Gunner location: %i\n", gunnerX);
}

void updateDisplay(int pSramAliens, int pSramBulletBuffer, int gunnerX, int step, int shift) {
    printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    printAliens(pSramAliens, step, shift);
    printVoid(pSramBulletBuffer);
    printGunner(gunnerX);
	checkGunnerWin();
	//printf("List Length: %i\n", listLength());
}
