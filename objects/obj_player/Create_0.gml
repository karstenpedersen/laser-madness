/// @description 

// Inherit the parent event
event_inherited();

hp = 3;

dash_speed = 12;
movement_speed = 2;
movement = false;

invincible_duration = 30;

audio_play_sound(snd_music, 50, true);

function s_use_weapon() {
	create_projectile(x, y, weapon.projectiles[0], id, direction);
	alarm[0] = weapon.cooldown;
}

function s_take_damage(_amount) {
	hp -= _amount;
	
	if (hp <= 0) {
		instance_destroy();
	} else {
		invincible = true;
		alarm[3] = invincible_duration;
	}
}

weapon = new weapon_player();
alarm[0] = weapon.cooldown;

dashing = false;
dash_duration = 15;
can_dash = true;

collision_list = ds_list_create();

dash_sound = false;