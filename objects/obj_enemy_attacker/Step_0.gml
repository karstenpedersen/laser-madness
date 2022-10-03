/// @description 

// Inherit the parent event
event_inherited();

if (instance_exists(obj_player)) {
	image_angle = point_direction(x, y, obj_player.x, obj_player.y);
}