/// @description 

// Collision
if (instance_exists(creator)) {
	#region Raycast
	#region Variables
	laser_length = 0;
	var _collisions = 0;
	var _collision_object,_object;
	#endregion
	
	while (_collisions <= piercing && laser_length < range) {
		laser_length += movement_speed;
		
		// Collision
		var _w = sprite_get_height(sprite_index)/2;
		var _x = x+lengthdir_x(laser_length,direction);
		var _y = y+lengthdir_y(laser_length,direction);
		_collision_object = collision_rectangle(_x-_w,_y-_w,_x+_w,_y+_w,par_entity_alive,true,true);
		if (_collision_object) {
			if (ds_list_find_index(collision_list,_collision_object) == -1) {
				ds_list_add(collision_list,_collision_object);
				_collisions++;
			}
		}
	}
	#endregion
	
	var _list_size = ds_list_size(collision_list);
	if (_list_size > 0) {
		var _i,_parent,_can_hit;
		for (_i = 0; _i < _list_size; _i++) {
			_object = ds_list_find_value(collision_list, _i);
			
			if (instance_exists(_object)) {
				_parent = object_get_parent(_object);
				show_debug_message(_parent == par_player)
				
				if (_parent == par_player) {
					if (enemy) {
						_object.s_take_damage(damage);
					}
				} else {
					if (!enemy) {
						_object.s_take_damage(damage);
					}
				}
			}
		}
		ds_list_clear(collision_list);
	}
}

// Draw laser
draw_line_stacked(x, y, 0, sprite_index, sprite_angle, laser_length);
