/// @description 

// Life time
if (lifetime >= 0) {
	if (lifetime > 0) {
		lifetime--;
	} else {
		instance_destroy();
	}
}