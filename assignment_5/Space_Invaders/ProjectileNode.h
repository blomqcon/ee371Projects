#ifndef projectile_node_H_   /* Include guard */
#define projectile_node_H_

    struct ProjectileNode {
        struct Projectile bullet;
        struct ProjectileNode *next;
    };

    void updateProjectileNodes(int pSramAliens, int pSramBulletBuffer, int gunnerX);
    void addProjectileNode(struct Projectile proj);
    struct Projectile createProjectile(char x, char dir, char symb, char t);

#endif // projectile_node_H_

