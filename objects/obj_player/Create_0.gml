/// @description 

// Inherit the parent event
event_inherited();

movement_speed = 2;
movement = false;

audio_play_sound(snd_music, 50, true);

function s_use_weapon() {
	create_projectile(x, y, weapon.projectiles[0], id, direction);
	alarm[0] = weapon.cooldown;
}

weapon = new weapon_player();
alarm[0] = weapon.cooldown;

dashing = false;

collision_list = ds_list_create();