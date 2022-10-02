/// @description 

// Inherit the parent event
event_inherited();

function s_use_weapon() {
	create_projectile(x, y, weapon.projectiles[0], self, sprite_angle);
	alarm[0] = weapon.cooldown;
}