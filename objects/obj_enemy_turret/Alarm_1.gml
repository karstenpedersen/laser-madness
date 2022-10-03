/// @description 

create_projectile(x, y, weapon.projectiles[0], id, image_angle, true);
create_projectile(x, y, weapon.projectiles[0], id, image_angle + 90, true);
create_projectile(x, y, weapon.projectiles[0], id, image_angle + 180, true);
create_projectile(x, y, weapon.projectiles[0], id, image_angle + 270, true);

alarm[1] = irandom_range(90, 120);

image_angle += 45;