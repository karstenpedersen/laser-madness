/// @description 

create_projectile(x, y, weapon.projectiles[0], id, image_angle - 30, true);
create_projectile(x, y, weapon.projectiles[0], id, image_angle, true);
create_projectile(x, y, weapon.projectiles[0], id, image_angle + 30, true);

alarm[1] = irandom_range(60, 120);