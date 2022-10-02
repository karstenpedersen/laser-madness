/// @description 

if (ds_list_find_index(collision_list, other) == -1 && !other.invincible && ((other == obj_player && enemy) || other != obj_player && !enemy)) {
	ds_list_add(collision_list, other);
	
	other.s_take_damage(damage);
	
	piercing--;
	if (piercing <= 0) {
		instance_destroy();
	}
}