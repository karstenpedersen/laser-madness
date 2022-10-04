/// @description 

// Inherit the parent event
event_inherited();

function s_use_weapon() {
	show_debug_message(string(self) + " Used weapon");
}

function s_take_damage(_amount) {
	hp -= _amount;
	
	if (hp <= 0) {
		instance_destroy();
	}
}