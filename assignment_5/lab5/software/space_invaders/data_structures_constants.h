#ifndef data_struct_const_H_   /* Include guard */
#define data_struct_const_H_

#define TRANSMIT_BUFFER_SIZE 50
#define ALIEN_COLS 8
#define ALIEN_ROWS 3
#define ALIEN_WIDTH 5
#define ALIEN_HEIGHT 3

#define VOID_HEIGHT 3

#define GUNNER_WIDTH 7
#define GUNNER_HEIGHT 2


#define transmit_enable (volatile char *) 0x000050c0
#define character_sent (volatile char *) 0x000050d0
#define data_bus_output (volatile char *) 0x000050f0
#define load (volatile char *) 0x000050e0
#define data_bus_input (volatile char *) 0x00005120
#define character_received (volatile char *) 0x00005110
#define data_bus_LEDs (volatile char *) 0x00005100

#define sram_data (volatile char *) 0x000050b0
#define sram_enable (volatile char *) 0x000050af
#define sram_readWrite (volatile char *) 0x0000509f
#define sram_address (volatile char *) 0x0000508f

#define gun_left (volatile char *) 0x00005070
#define gun_right (volatile char *) 0x00005060
#define gun_shoot (volatile char *) 0x00005050

#define alien_x (volatile char *) 0x00005040
#define alien_y (volatile char *) 0x00005030
#define alien_shoot (volatile char *) 0x00005020

#define random_number (volatile unsigned int *) 0x00005010
#define game_time (volatile unsigned int *) 0x00004100





extern const char* empty_space;
extern const char* alien0; //straight line, slow but 'reloads' quickly
extern const char* alien1;//straight line, fast but 'reloads' slowly
extern const char* alien2;//two shots go off at angles, slow and 'reloads' slowly
extern const char* gunner;// straight line, very fast, 'reloads very fast'

extern int pSramAliens;
extern int alienShift;

struct Alien {
    //instead of using multiple chars this data could be stored
    //in a single char and placed/extracted with bit shifts.
    //might do this in the future.
    char alive;
    char type;
    char rowId;
};

struct Projectile {
    char xVal;
    char yVal;
    char direction;
    char symbol;
    char type;
    char timeTick;
};

#endif // data_struct_const_H_
