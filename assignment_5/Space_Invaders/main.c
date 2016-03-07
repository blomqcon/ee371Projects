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
#include "ProjectileNode.h"


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
    int pSramBulletBuffer = sram_malloc(sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT));

    printf("%i\n", sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT));
    //New Game
    int gameTime = 0;
    int gunnerX = 37; //max value 39 (ALIEN_WIDTH * ALIEN_COLS)
    initRandomAliens(pSramAliens);
    int updateToggle = 1;
    int gunnerToggle = 1;

    addProjectileNode(createProjectile(3, 1, '^', 1));
    addProjectileNode(createProjectile(2, 1, '^', 1));

    //Game Event Loop
    while(1) {
        updateGameTime(&gameTime, &startTimer);
        updateToggleValues(gameTime, &updateToggle, &gunnerToggle);

        if((gameTime % 10 == 0) && updateToggle) {
            int shift = (gameTime / 20) % 8;
            updateDisplay(pSramAliens, pSramBulletBuffer, gunnerX, gameTime % 2, shift);
            updateToggle = 0;
        }

        if((gameTime % 20 == 0) && gunnerToggle) {
            moveGunnerRight(&gunnerX);
            gunnerToggle = 0;
            updateProjectileNodes(pSramBulletBuffer);
        }
    }

    return 0;
}
