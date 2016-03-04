#ifndef SRAM_H_   /* Include guard */
#define SRAM_H_

//This won't be here when when running for real
//we'll be using the nios sram
char sram[2048];

void resetSRAM();
int sram_malloc(int s);
int sram_free(int loc);

void clearAliens();
struct Alien getAlien(int pSramAliens, int x, int y);
void setAlien(int pSramAliens, int x, int y, struct Alien alien);

#endif // SRAM_H_
