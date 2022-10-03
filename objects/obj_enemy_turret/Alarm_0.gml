/// @description 

if (!instance_exists(obj_player)) return;
	

var _distance_to_player = distance_to_object(obj_player);
var _x = x;
var _y = y;
var _speed = 0;

if (_distance_to_player >= 280) {
	var _len = 128;
	var _dir = irandom(360);
	_x = obj_player.x + lengthdir_x(_len, _dir);
	_y = obj_player.y + lengthdir_y(_len, _dir);
	_speed = 1;
} else if (_distance_to_player <= 96) {
	var _len = 128;
	var _dir = irandom(360);
	_x = obj_player.x + lengthdir_x(_len, _dir);
	_y = obj_player.y + lengthdir_y(_len, _dir);
	_speed = 1;
}

move_towards_point(_x, _y, _speed);

alarm[0] = choose(60, 120,);
