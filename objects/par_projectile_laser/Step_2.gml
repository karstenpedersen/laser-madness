/// @description 

if (instance_exists(creator)) {
	// Follow creator
	var _angle = creator.sprite_angle + 90;
	var _offset = 10;
	x = creator.x + lengthdir_x(_offset, _angle);
	y = creator.y + lengthdir_y(_offset, _angle);
	
	sprite_angle = _angle;
}