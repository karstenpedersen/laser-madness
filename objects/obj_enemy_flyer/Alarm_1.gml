/// @description 

var _bullet_count = instance_number(par_projectile_bullet);

if ((_bullet_count > 10 && irandom(100) <= 40) || _bullet_count <= 10) {
	create_projectile(x, y, weapon.projectiles[0], id, image_angle, true);
}

alarm[1] = irandom_range(60, 120);