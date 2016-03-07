#ifndef game_logic_H_   /* Include guard */
#define game_logic_H_

void initializeGame(clock_t startTimer);
void updateGameTime(int* gameTime, clock_t* startTimer);
void updateToggleValues(int gameTime, int* updateToggle, int* gunnerToggle);

void moveGunnerRight(int* gunnerX);
void moveGunnerLeft(int* gunnerX);
void shootGunner(int* gunnerX);
void shootAliens();

void checkCollideAliens(int pSramAliens, int x);
int checkCollideGunner(int gunnerX, int projX, int projY, int* gameOver);

#endif // game_logic_H_
