/// @description 

if (ds_list_find_index(collision_list, other.id) == -1 && !other.invincible) {
	var _collide = false;
	var _player = false;
	
	var _parent = object_get_parent(other.object_index);
	
	if (_parent == par_player && enemy) {
		_collide = true;
		_player = true;
	} else if (_parent == par_enemy && !enemy) {
		_collide = true;
	}
	
	if (_collide) {
		ds_list_add(collision_list, other.id);
		
		audio_play_sound(snd_player_damage,40,false);
	
		other.s_take_damage(damage);
	
		piercing--;
		if (_player || piercing <= 0) {
			instance_destroy();
		}
	}
}