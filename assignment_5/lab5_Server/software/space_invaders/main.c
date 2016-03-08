#include <stdio.h>
#include "sys/alt_stdio.h"
#include <stdlib.h>
#include "altera_avalon_pio_regs.h"
#include "altera_nios2_qsys_irq.h"
#include "sys/alt_irq.h"
#include "system.h"

//#include <unistd.h>
//#include <fcntl.h>
//#include "altera_avalon_pio_regs.h"
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
	//fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);
	alt_putstr("Hello from Nios II!\n");
	*character_received = 0;
	char *msg = "Hello from a different Nios II!";
	int j;
	unsigned char incoming;
	while (1) {
		//msg = fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

		if (*character_received) {
			incoming = getCharacter(*data_bus_input);
			alt_printf("Incoming: %c \n", incoming);

			while(*character_received) {
			}
		}

	return 0;

		/*if (msg[0] == '#') {
			for (j = 0; j < 16; j++) {
				*transmit_enable = 0x0;
				*load = 0x0;
				*parallel_out = setParity(msg[j]);
				usleep(1000);
				*transmit_enable = 0x1;
				*load = 0x1;
				usleep(50);
				*load = 0x0;
				usleep(50);
			}

			msg = "#";
		}*/
	}
	
	
    //FOR NIOS
	//fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

    //Tests
    //sram_malloc_test();
    //sram_free_test();

    //Game Init
	/*setup_interrupt();
    initializeGame();
	
    pSramAliens = sram_malloc(sizeof(struct Alien) * (ALIEN_COLS * ALIEN_ROWS));
    int pSramBulletBuffer = sram_malloc((sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT)) + sizeof(struct Projectile));

	
	
    //printf("%i\n", sizeof(struct Projectile) * (ALIEN_COLS * ALIEN_WIDTH * VOID_HEIGHT));
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
	
	*data_bus_output = 0xAF;
	
	//while(1);
	
	char hello[20] = "Hello, world! abc123";
	int i;
	for(i = 0; i < 20; i++) {
		writeBuffer(hello[i]);
	}
	transmitIfBufferNotEmpty();
	
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
		//gameOver =1;
		
		if(((*game_time) - previousUpdateBoard) > 10) {
			alienShift = ((*game_time) / 10) % 8;
			//alienShift = 2;
			//updateDisplay(pSramAliens, pSramBulletBuffer, gunnerX, (*game_time) % 2, alienShift);			
			previousUpdateBoard = (*game_time);
		}
		
		if(((*game_time) - previousUpdateBullets) > 5) {
			updateProjectileNodes();
			previousUpdateBullets = (*game_time);
		}
		
		moveGunnerLeft(&gunnerX);
		moveGunnerRight(&gunnerX);
		//shootGunner(&gunnerX);
		shootAliens();
	}
	
    return 0;*/
}
