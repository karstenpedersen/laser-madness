/// @description 

// Inherit the parent event
event_inherited();

// Life time
if (lifetime >= 0) {
	if (lifetime > 0) {
		lifetime--;
	} else {
		instance_destroy();
	}
}