#include "sram.h"
#include "data_structures_constants.h"
#include "ProjectileNode.h"
#include "gamelogic.h"

//for std malloc
#include <stdlib.h>

struct ProjectileNode *head = NULL;
struct ProjectileNode *end = NULL;

void removeProjectileNode(struct ProjectileNode* proj) {
    if(head == proj) {
        if(proj == end) end = NULL;
        head = proj->next;
    } else {
        struct ProjectileNode* current = head;
        while(current->next != proj) { }
        current->next = proj->next;
        if(proj == end) end = current->next;
    }
	//printf("removed success x:%i y:%i", proj->bullet.xVal, proj->bullet.yVal);
    //free(proj);
}

void updateProjectileNodes() {
    //if head is null, return
    if(head == NULL) return;

    struct ProjectileNode* current = head;
    while(current != NULL) {
        if(current->bullet.timeTick < abs(current->bullet.direction)) {
            current->bullet.timeTick++;
        } else {
            current->bullet.timeTick = 0;
            if(current->bullet.type == 1) { //Straight Line
                current->bullet.yVal -= (current->bullet.direction < 0);
                current->bullet.yVal += (current->bullet.direction > 0);
            }
        }
        //printf("New Bullet Loc (%i, %i)\n", current->bullet.xVal, current->bullet.yVal);

        struct ProjectileNode* tempCurrent = current;
        current = current->next;

        if(tempCurrent->bullet.yVal < -1) {
            checkCollideGunner((int)tempCurrent->bullet.xVal);
            removeProjectileNode(tempCurrent);
        } else if (tempCurrent->bullet.yVal > VOID_HEIGHT && (int)tempCurrent->bullet.direction >= 1) {
			int alienX = ((int) tempCurrent->bullet.xVal) / ALIEN_WIDTH;
            checkCollideAliens(pSramAliens, alienX);
            removeProjectileNode(tempCurrent);
        }
    }
    printf("\n");
}


void initProjectileBuffer(int pSramBulletBuffer) {
	int x, y;
    for(x = 0; x < (ALIEN_COLS * ALIEN_WIDTH); x++) {
        for(y = 0; y < VOID_HEIGHT; y++) {
			struct Projectile empty = createProjectile(0, 0, 0, 0);
			setProjectile(pSramBulletBuffer, x, y, empty);
        }
    }
}

void updateProjectileBuffer(int pSramBulletBuffer) {
    if(head == NULL) return;
	initProjectileBuffer(pSramBulletBuffer);
    struct ProjectileNode* current = head;
    while(current != NULL) {
        //printf("Values: %i, %i - %i\n", current->bullet.xVal, current->bullet.yVal, current->bullet.type);
		
		struct Projectile p = current->bullet;
		setProjectile(pSramBulletBuffer, current->bullet.xVal, current->bullet.yVal, p);
        current = current->next;
    }
}

void addProjectileNode(struct Projectile proj) {
    if(head == NULL) {
        head = (struct ProjectileNode*)malloc(sizeof(struct ProjectileNode));
        head->bullet = proj;
        head->next = NULL;
        end = head;
    } else {
        struct ProjectileNode* nextProj = (struct ProjectileNode*)malloc(sizeof(struct ProjectileNode));
        nextProj->bullet = proj;
        nextProj->next = NULL;
		
        end->next = nextProj;
        end = nextProj;
    }
}

int listLength() {
	if(head == NULL) return 0;
	int size = 0;
	
	struct ProjectileNode* current = head;
    while(current != NULL) {
        size++;
		struct Projectile p = current->bullet;
		current = current->next;
    }
	return size;
}

struct Projectile createProjectile(char x, char dir, char symb, char t) {
    struct Projectile proj;
    proj.xVal = x;
    proj.yVal = 0;
    proj.direction = dir;
    proj.symbol = symb;
    proj.type = t;
    proj.timeTick = 0;
    return proj;
}
