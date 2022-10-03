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
		var _w = sprite_get_height(sprite_index) / 2;
		var _x = x+lengthdir_x(laser_length, image_angle);
		var _y = y+lengthdir_y(laser_length, image_angle);
		_collision_object = collision_rectangle(_x-_w,_y-_w,_x+_w,_y+_w,par_entity_alive,true,true);
		
		if (_collision_object && _collision_object != creator) {
			if (ds_list_find_index(collision_list, _collision_object) == -1) {
				ds_list_add(collision_list, _collision_object);
				_collisions++;
			}
		}
		
		_collision_object = collision_rectangle(_x-_w,_y-_w,_x+_w,_y+_w,par_projectile_bullet,true,true);
		
		if (_collision_object && _collision_object != creator) {
			if (ds_list_find_index(collision_list, _collision_object) == -1) {
				ds_list_add(collision_list, _collision_object);
				_collisions++;
			}
		}
	}
	#endregion
	var _i,_parent;
	for (_i = 0; _i < _collisions; _i++) {
		_object = ds_list_find_value(collision_list, _i);
		if (instance_exists(_object)) {
			_parent = object_get_parent(_object);
			show_debug_message(object_get_name(_object));
			if (_parent == par_player) {
				if (enemy && creator != _object) {
					_object.s_take_damage(damage);
				}
			} else if (_parent == par_entity_alive) {
				if (!enemy) {
					_object.s_take_damage(damage);
				}
			} else {
				instance_destroy(_object);
			}
		}
	}
	ds_list_clear(collision_list);
}

// Draw laser
draw_line_stacked(x, y, 0, sprite_index, image_angle, laser_length);
