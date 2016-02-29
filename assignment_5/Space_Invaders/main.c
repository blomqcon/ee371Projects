#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

#include <time.h>
#include <unistd.h>
#include <fcntl.h>

const int SCREEN_WIDTH = 10;
const int SCREEN_HEIGHT = 5;

const char empty_space[] = "                                    ";

const char alien1[] =  " /MM\\  |~~|        /MM\\  \\~~/       ";
const char alien2[] = " dOOb  ^/\\^        dOOb  ~||~       ";
const char gunner[]  = "  mAm   MAZAM ";


int gunnerXPos = 0;


void printAlienRow(char* alien, int animationStep, int row) {
    int offset = animationStep * 18;
    int i;
    for(i = 0; i < 6; i++) {
        int index = (row*6) + i + offset;
        printf("%c", alien[index]);
    }
}

void printAliens(char* screen, int animationStep) {
    int i, j, k;
    for(i = 0; i < SCREEN_HEIGHT; i++) {
        for(k = 0; k < 3; k++) {
            for(j = 0; j < SCREEN_WIDTH; j++) {
                if(screen[(i*SCREEN_WIDTH) + j] == 1) {
                    printAlienRow(alien1, animationStep, k);
                } else if(screen[(i*SCREEN_WIDTH) + j] == 2) {
                    printAlienRow(alien2, animationStep, k);
                } else {
                    printAlienRow(empty_space, animationStep, k);
                }
            }
            printf("\n");
        }
    }
}

printGunnerRow(int row) {
    int i;
    for(i = 0; i < 7; i++) {
        int index = (row*7) + i;
        printf("%c", gunner[index]);
        //printf("a");
    }
}

void printGunner(int x) {
    int i, k;
    for(k = 0; k < 2; k++) {
        for(i = 0; i < 60; i++) {
            if(i == x) {
                printGunnerRow(k);
                i += 6;
            } else {
                printf("%c", 0x20);
            }
        }
        printf("\n");
    }

}

void printScreen(char* screen, int animationStep) {
    system("cls");
    printAliens(screen, animationStep);
    printGunner(gunnerXPos);
    printf("Move: ");
}

void move() {
    char c;
    if(_kbhit()) {
        c = getchar();
        if(c == 'a') {
            gunnerXPos--;
        } else if(c == 'd') {
            gunnerXPos++;
        }
    }
}

int main()
{
    //FOR NIOS
	//fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

    //char* screenBuffer = calloc((5*10) * (3*10), sizeof(char));
    char* screen = calloc(SCREEN_WIDTH * SCREEN_HEIGHT, sizeof(char));

    screen[5] = 1;
    screen[6] = 1;
    screen[7] = 2;
    screen[9] = 2;
    screen[12] = 2;
    screen[14] = 2;

    int animationStep = 0;

    printScreen(screen, animationStep);

    int i;

    time_t previous_seconds;
    previous_seconds = time (NULL);


    while(1) {

        time_t seconds;
        seconds = time (NULL);
        if(seconds - previous_seconds > 1) {
            printScreen(screen, animationStep);
            previous_seconds = seconds;
            if(animationStep == 0)
                animationStep = 1;
            else
                animationStep = 0;
        }
        move();

        //printf("seconds: %i", seconds);
        Sleep(1000);
    }

    return 0;
}
