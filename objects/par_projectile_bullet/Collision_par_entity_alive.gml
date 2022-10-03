/// @description 

if (ds_list_find_index(collision_list, other.id) == -1 && !other.invincible && ((other.id == obj_player.id && enemy) || (other.id != obj_player.id && !enemy))) {
	ds_list_add(collision_list, other.id);
	
	other.s_take_damage(damage);
	
	piercing--;
	if (piercing <= 0) {
		instance_destroy();
	}
}