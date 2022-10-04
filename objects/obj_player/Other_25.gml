/// @description 

// Inherit the parent event
event_inherited();

function s_use_weapon() {
	create_projectile(x, y, weapon.projectiles[0], id, direction);
	alarm[0] = weapon.cooldown;
}

function s_take_damage(_amount) {
	hp -= _amount;
	
	if (hp <= 0) {
		audio_play_sound(snd_player_death,40,false);

		instance_destroy();
	} else {
		invincible = true;
		alarm[3] = invincible_duration;
		
		audio_play_sound(snd_player_damage, 40, false);
	}
}