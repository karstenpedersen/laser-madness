/// @description 

// Inherit the parent event
event_inherited();

// Rotate 
direction = -global.z_angle;
image_angle = direction;

// Movement
movement = keyboard_check(ord("W"))+keyboard_check(ord("A"))+keyboard_check(ord("S"))+keyboard_check(ord("D"));

if (!dashing && movement) {
	var delta_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
	var delta_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
	var angle = point_direction(0,0,delta_x,delta_y)-global.z_angle;
	x += lengthdir_x(movement_speed,angle);
	y += lengthdir_y(movement_speed,angle);
}

if (dashing) {
	var angle = direction + 90;
	
	if (movement) {
		var delta_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
		var delta_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
		angle = point_direction(0,0,delta_x,delta_y)-global.z_angle;
	}
	
	x += lengthdir_x(dash_speed, angle);
	y += lengthdir_y(dash_speed, angle);
	
	create_dust(5);
} else if (keyboard_check_pressed(vk_space)) {
	dashing = true;
	invincible = true;
	alarm[1] = dash_duration;
}

var b = 512;
x = clamp(x,b,room_width-b);
y = clamp(y,b,room_height-b);