#include "sram.h"
#include "data_structures_constants.h";
#include "ProjectileNode.h"

//for std malloc
#include <stdlib.h>

struct ProjectileNode *head;
struct ProjectileNode *current;

void updateProjectileNode() {
    //if head is null, return
    if(!head) return;

    struct Projectile bullet;
    struct ProjectileNode* nextProj = head;
    do {
        bullet = nextProj->bullet;
        if(bullet.timeTick < abs(bullet.direction)) {
            nextProj->bullet.timeTick++;
        } else {
            nextProj->bullet.timeTick = 0;
            if(bullet.type == 1) {
                if(bullet.direction < 0) {
                    nextProj->bullet.yVal--;

                    if(nextProj->bullet.yVal < GUNNER_HEIGHT) {
                        //int collide = checkCollideGunner(nextProj->bullet.xVal, nextProj->bullet.yVal);
                        //if(collide) removeProjectileNode(nextProj->bullet);
                    }
                } else if(bullet.direction > 0) {
                    nextProj->bullet.yVal++;

                    if(nextProj->bullet.yVal > GUNNER_HEIGHT + VOID_HEIGHT) {
                        //int collide = checkCollideAliens(nextProj->bullet.xVal, nextProj->bullet.yVal);
                        //if(collide) removeProjectileNode(nextProj->bullet);
                    }
                } else {
                    continue;
                }
            } else {
                continue;
            }
        }
        nextProj = nextProj->next;
    } while(nextProj);
}

void addProjectileNode(struct Projectile proj) {
    if(!head) {
        head = (struct ProjectileNode*)malloc(sizeof(struct ProjectileNode));
        head->bullet = proj;
        current = head;
    } else {
        struct ProjectileNode* nextProj = (struct ProjectileNode*)malloc(sizeof(struct ProjectileNode));
        nextProj->bullet = proj;
        current->next = nextProj;
        current = nextProj;
    }
}

void removeProjectileNode(struct Projectile proj) {
    struct ProjectileNode* nextProj = head;

    //if there is only one projectile in the list
    if(!nextProj->next) {
        head = NULL;
        current = head;
    } else {
        while(nextProj->next) {

        }
    }
}
