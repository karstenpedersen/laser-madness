/// @description 

// Inherit the parent event
event_inherited();

movement_speed = 2;
movement = false;

function s_use_weapon() {
	show_debug_message("TEST" + string(object_get_name(id)))
	create_projectile(x, y, weapon.projectiles[0], id, sprite_angle);
	alarm[0] = weapon.cooldown;
}

weapon = new weapon_player();
s_use_weapon();