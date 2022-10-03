/// @description 

// Inherit the parent event
event_inherited();


// Collision
var _length = 0;
var _collisions = 0;
var _collision_object,_object;

draw_set_color(c_white);

var _speed = 18;
var _max_length = (weapon.cooldown - alarm[0]) / weapon.cooldown * ( weapon.projectiles[0].range - _speed);
 
while (_length < _max_length) {
	_length += _speed;
		
	// Collision
	var _x = x+lengthdir_x(_length, image_angle + 90);
	var _y = y+lengthdir_y(_length, image_angle + 90);
	
	draw_circle(_x, _y, 2, false);
}

ds_list_clear(collision_list);