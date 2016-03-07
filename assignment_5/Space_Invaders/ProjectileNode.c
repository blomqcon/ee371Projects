#include "sram.h"
#include "data_structures_constants.h";
#include "ProjectileNode.h"

//for std malloc
#include <stdlib.h>

struct ProjectileNode *head = NULL;
struct ProjectileNode *end = NULL;

void updateProjectileNodes(int pSramBulletBuffer) {
    //if head is null, return
    if(head == NULL) return;
    struct Projectile empty = createProjectile(0, 0, 0, 0);

    //clearProjectileBuffer(pSramBulletBuffer);
    struct ProjectileNode* current = head;
    while(current != NULL) {
        if(current->bullet.timeTick < abs(current->bullet.direction)) {
            current->bullet.timeTick++;
        } else {
            current->bullet.timeTick = 0;
            setProjectile(pSramBulletBuffer, current->bullet.xVal, current->bullet.yVal, empty);
            if(current->bullet.type == 1) { //Straight Line
                current->bullet.yVal -= (current->bullet.direction < 0);
                current->bullet.yVal += (current->bullet.direction > 0);
            }
        }
        //printf("New Bullet Loc (%i, %i)\n", current->bullet.xVal, current->bullet.yVal);

        struct ProjectileNode* tempCurrent = current;
        current = current->next;

        if(tempCurrent->bullet.yVal < 0) {
            //checkCollideGunner();
            removeProjectileNode(tempCurrent);
        } else if (tempCurrent->bullet.yVal > VOID_HEIGHT) {
            //checkCollideAliens();
            removeProjectileNode(tempCurrent);
        }
    }
    updateProjectileBuffer(pSramBulletBuffer);
    printf("\n");
}

void updateProjectileBuffer(int pSramBulletBuffer) {
    if(head == NULL) return;

    struct ProjectileNode* current = head;
    while(current != NULL) {
        setProjectile(pSramBulletBuffer, current->bullet.xVal, current->bullet.yVal, current->bullet);
        current = current->next;
    }
}

/*
void clearProjectileBuffer(int pSramBulletBuffer) {
    int x;
    int y;;
    struct Projectile bullet = createProjectile(0, 0, 0, 0);
    for(x = 0; x <= 7; x++) {
        for(y = 0; y < VOID_HEIGHT; y++) {
            setProjectile(pSramBulletBuffer, x, y, bullet);
        }
    }
}
*/

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
    free(proj);
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
