#ifndef projectile_node_H_   /* Include guard */
#define projectile_node_H_

    struct ProjectileNode {
        struct Projectile bullet;
        struct ProjectileNode *next;
    };

    void addProjectileNode();
    void removeProjectileNode();

#endif // projectile_node_H_

