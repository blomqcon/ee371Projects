#include <stdio.h>
#include "sys/alt_stdio.h"
#include <stdlib.h>
#include "altera_avalon_pio_regs.h"
#include "altera_nios2_qsys_irq.h"
#include "sys/alt_irq.h"
#include "system.h"
//#include <unistd.h>
//#include <fcntl.h>

//IOWR_ALTERA_AVALON_PIO_DATA(targetAddress, aValue);
//aValue = IOWR_ALTERA_AVALON_PIO_DATA(sourceAddress);

#include "data_structures_constants.h"
#include "sram.h"
#include "display.h"
#include "gamelogic.h"
#include "ProjectileNode.h"
#include "communication.h"

int pSramAliens = 0;
int alienShift = 0;
int gameOver = 0;
int gunnerX = ((ALIEN_WIDTH * ALIEN_COLS) / 2) - (GUNNER_WIDTH / 2);

char* pBuffer;
char* pBufferHead;
char* pTransmit;



int main()
{
    //Game Init
		setup_interrupt();
    initializeGame();

  pSramAliens = sram_malloc(sizeof(struct Alien) * (ALIEN_COLS * ALIEN_ROWS));
  int pSramBulletBuffer = sram_malloc((sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT)) + sizeof(struct Projectile));
		
  //New Game
	gameOver = 0;
	unsigned int  gameStartTime = *game_time;
	unsigned int  previousUpdateBoard = *game_time;
	unsigned int  previousUpdateBullets = *game_time;
    
	initRandomAliens(pSramAliens);
	initProjectileBuffer(pSramBulletBuffer);
	pBuffer = calloc(TRANSMIT_BUFFER_SIZE, sizeof(char));
	pBufferHead = pBuffer;
	pTransmit = pBuffer;
	
	*data_bus_output = 0xFF;
	
	//Game Event Loop
    while(1) {
		if(gameOver) {
			if(gameOver == 1) {
				printf("\nAliens Win!\n");
			} else if(gameOver ==2) {
				printf("\nGunner Win!\n");
			}
			return 0;
		}
		
		if(((*game_time) - previousUpdateBoard) > 10) {
			alienShift = ((*game_time) / 10) % 8;
			updateDisplay(pSramAliens, pSramBulletBuffer, gunnerX, (*game_time) % 2, alienShift);
			previousUpdateBoard = (*game_time);
		}
		
		if(((*game_time) - previousUpdateBullets) > 5) {
			updateProjectileNodes();
			previousUpdateBullets = (*game_time);
		}
		
		/*moveGunnerLeft(&gunnerX);
		moveGunnerRight(&gunnerX);
		shootAliens();*/
	}
	
    return 0;
}
