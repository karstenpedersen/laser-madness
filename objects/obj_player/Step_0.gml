/// @description 


	
var angle = -global.z_angle;
	
sprite_angle = angle;
movement = keyboard_check(ord("W"))+keyboard_check(ord("A"))+keyboard_check(ord("S"))+keyboard_check(ord("D"));

if (movement) {
	var delta_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
	var delta_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
	var angle = point_direction(0,0,delta_x,delta_y)-global.z_angle;
	x += lengthdir_x(movement_speed,angle);
	y += lengthdir_y(movement_speed,angle);

	var b = 32;
	x = clamp(x,b,room_width-b);
	y = clamp(y,b,room_height-b);
}