#ifndef display_H_   /* Include guard */
#define display_H_

void updateDisplay(int pSramAliens, int gunnerX, int step, int shift);
struct Alien newAlien(char alive, char type, char id);
void initRandomAliens(int pSramAliens);

#endif // display_H_
