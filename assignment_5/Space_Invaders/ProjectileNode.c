#include "sram.h"
#include "data_structures_constants.h";
#include "ProjectileNode.h"

//for std malloc
#include <stdlib.h>

struct ProjectileNode *head = NULL;
struct ProjectileNode *end = NULL;

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

        if(tempCurrent->bullet.yVal < 0) {
            //checkCollideGunner();
            removeProjectileNode(tempCurrent);
        } else if (tempCurrent->bullet.yVal > VOID_HEIGHT) {
            //checkCollideAliens();
            removeProjectileNode(tempCurrent);
        }
    }
    printf("\n");
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
