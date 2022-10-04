/// @description 

// Inherit the parent event
event_inherited();

// Draw laser guide (so player can see where they shoot)
var _length = 0;
var _speed = 18;
var _procent = (weapon.cooldown - alarm[0]) / weapon.cooldown;
var _max_length = _procent * ( weapon.projectiles[0].range - _speed);
 
var _curveStruct = animcurve_get(anc_aim_shake);
var _channel = animcurve_get_channel(_curveStruct, "curve");
var _curveValue = animcurve_channel_evaluate(_channel, _procent); 

while (_length < _max_length) {
	draw_set_color(c_white);
	draw_set_color(make_color_hsv(0, 0, 255 * _procent));
	_length += _speed;
		
	// Collision
	var _x = x + lengthdir_x(_length, image_angle + 90);
	var _y = y + lengthdir_y(_length, image_angle + 90);
	
	var _r = _curveValue * 2;
	_x += irandom_range(-_r, _r);
	_y += irandom_range(-_r, _r);
	
	draw_circle(_x, _y, 2, false);
}

ds_list_clear(collision_list);