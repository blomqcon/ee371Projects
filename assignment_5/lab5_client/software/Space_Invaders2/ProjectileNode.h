#ifndef projectile_node_H_   /* Include guard */
#define projectile_node_H_

    struct ProjectileNode {
        struct Projectile bullet;
        struct ProjectileNode *next;
    };

	
    void updateProjectileNodes();
    void addProjectileNode(struct Projectile proj);
    struct Projectile createProjectile(char x, char dir, char symb, char t);
	int listLength();
	
	
	void initProjectileBuffer(int pSramBulletBuffer);
    void updateProjectileBuffer(int pSramBulletBuffer);

#endif // projectile_node_H_

