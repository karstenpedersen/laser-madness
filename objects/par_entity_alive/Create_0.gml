/// @description 

// Inherit the parent event
event_inherited();

function s_take_damage(_amount) {
	hp -= _amount;
	
	if (hp <= 0) {
		instance_destroy();
	}
}

invincible = false;
invincible_timer = 0;

hp = 1;

weapon_cooldown = 0;
weapon = undefined;

function s_use_weapon() {
	show_debug_message(string(self) + " Used weapon");
}