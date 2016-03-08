#ifndef game_logic_H_   /* Include guard */
#define game_logic_H_

void initializeGame();
void updateToggleValues(int gameTime, int* updateToggle, int* gunnerToggle);

void moveGunnerRight(int* gunnerX);
void moveGunnerLeft(int* gunnerX);
void shootGunner(int* gunnerX);
void shootAliens();

void checkCollideAliens(int pSramAliens, int x);
void checkCollideGunner(int projX);

void checkGunnerWin();

#endif // game_logic_H_
