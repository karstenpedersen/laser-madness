/// @description 

// Inherit the parent event
event_inherited();

movement_speed = 2;
movement = false;

function s_use_weapon() {
	create_projectile(x, y, weapon.projectiles[0], self, sprite_angle);
	alarm[0] = weapon.cooldown;
}

weapon = new weapon_player();
s_use_weapon();