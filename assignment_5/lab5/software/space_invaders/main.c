#include <stdio.h>
#include <stdlib.h>
#include <time.h>
//#include <unistd.h>
//#include <fcntl.h>

#include "data_structures_constants.h"
#include "sram.h"
#include "display.h"
#include "gamelogic.h"
#include "ProjectileNode.h"


clock_t startTimer;

int pSramAliens = 0;
int alienShift = 0;

int main()
{
    //FOR NIOS
	//fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

    //Tests
    //sram_malloc_test();
    //sram_free_test();

    //Game Init
    initializeGame(startTimer);
    pSramAliens = sram_malloc(sizeof(struct Alien) * (ALIEN_COLS * ALIEN_ROWS));
    int pSramBulletBuffer = sram_malloc((sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT)) + sizeof(struct Projectile));

    //printf("%i\n", sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT));
    //New Game
	unsigned int  gameStartTime = *game_time;
	unsigned int  previousUpdateBoard = *game_time;
	unsigned int  previousUpdateBullets = *game_time;
    
    initRandomAliens(pSramAliens);
	initProjectileBuffer(pSramBulletBuffer);
	int gunnerX = 37; //max value 39 (ALIEN_WIDTH * ALIEN_COLS)

	
	/*printf("List Length: %i\n", listLength());
    addProjectileNode(createProjectile(5, 1, '^', 1));
	printf("List Length: %i\n", listLength());
    addProjectileNode(createProjectile(6, 1, '^', 1));
	printf("List Length: %i\n", listLength());*/
	
	
	
	//Game Event Loop
    while(1) {
		if(((*game_time) - previousUpdateBoard) > 10) {
			alienShift = ((*game_time) / 10) % 8;
            updateDisplay(pSramAliens, pSramBulletBuffer, gunnerX, (*game_time) % 2, alienShift);			
			previousUpdateBoard = (*game_time);
		}
		
		if(((*game_time) - previousUpdateBullets) > 5) {
			updateProjectileNodes();
			previousUpdateBullets = (*game_time);
		}
		
		moveGunnerLeft(&gunnerX);
		moveGunnerRight(&gunnerX);
		shootGunner(&gunnerX);
		//shootAliens();
 
    }

    return 0;
}
