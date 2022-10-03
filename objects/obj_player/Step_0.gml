/// @description 

// Inherit the parent event
event_inherited();

// Rotate 
direction = -global.z_angle;
image_angle = direction;

image_blend = invincible ? c_gray : c_white;

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
} else if (can_dash && keyboard_check_pressed(vk_space)) {
	audio_play_sound(snd_player_dash,40,false);
	dash_sound = true;
	dashing = true;
	can_dash = false;
	invincible = true;
	alarm[1] = dash_duration;
}

if (can_dash) {
	if (dash_sound) {
		audio_play_sound(snd_player_dash_full,40,false);
		dash_sound = false;
	}
			
	var _angle = 15;
	var _len = 6;
	var _dir = image_angle - 90;
	var _x = x - 12 + lengthdir_x(_len, _dir);
	var _y = y + lengthdir_y(_len, _dir);
	with (instance_create_layer(_x, _y, "Instances", obj_effect_dust)) {
		direction = _dir + irandom_range(-_angle, _angle);
	}
	
	var _x = x + 12 + lengthdir_x(_len, _dir);
	var _y = y + lengthdir_y(_len, _dir);
	with (instance_create_layer(_x, _y, "Instances", obj_effect_dust)) {
		direction = _dir + irandom_range(-_angle, _angle);
	}
}

var b = 512;
x = clamp(x,b,room_width-b);
y = clamp(y,b,room_height-b);