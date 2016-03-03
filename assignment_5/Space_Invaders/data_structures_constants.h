#ifndef data_struct_const_H_   /* Include guard */
#define data_struct_const_H_

#define TRANSMIT_BUFFER_SIZE 50
#define ALIEN_COLS 8
#define ALIEN_ROWS 3
#define ALIEN_WIDTH 5
#define ALIEN_HEIGHT 3

#define VOID_HEIGHT 5

#define GUNNER_WIDTH 7
#define GUNNER_HEIGHT 2

#define SCREEN_WIDTH 73

/*#define transmit_enable (volatile char *) 0x00003040
#define character_sent (volatile char *) 0x00003050
#define data_bus_output (volatile char *) 0x00003070
#define load (volatile char *) 0x00003060
#define data_bus_input (volatile char *) 0x000030a0
#define character_received (volatile char *) 0x00003090
#define data_bus_LEDs (volatile char *) 0x00003080*/

//These are the memory locations you will need to pass to
volatile int* address;//11 bit address (log2(2048) = 11)
volatile char* data;//8 bit data
volatile char* enable; //1:enabled, 0: disabled
volatile char* readWrite; //0:read, 1: write

extern const char* empty_space;
extern const char* alien0; //straight line, slow but 'reloads' quickly
extern const char* alien1;//straight line, fast but 'reloads' slowly
extern const char* alien2;//two shots go off at angles, slow and 'reloads' slowly
extern const char* gunner;// straight line, very fast, 'reloads very fast'

struct Alien {
    //instead of using multiple chars this data could be stored
    //in a single char and placed/extracted with bit shifts.
    //might do this in the future.
    char alive;
    char type;
    char rowId;
};

#endif // data_struct_const_H_
