#ifndef projectile_node_H_   /* Include guard */
#define projectile_node_H_

    struct ProjectileNode {
        struct Projectile bullet;
        struct ProjectileNode *next;
    };

    void updateProjectileNode();
    void addProjectileNode(struct Projectile proj);
    //void removeProjectileNode(Projectile proj);

#endif // projectile_node_H_

