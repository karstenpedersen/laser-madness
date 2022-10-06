/// @description 

// Inherit the parent event
event_inherited();

// Rotate 
direction = -global.z_angle;
image_angle = direction;

// Movement
movement = keyboard_check(ord("W")) + keyboard_check(ord("A")) + keyboard_check(ord("S")) + keyboard_check(ord("D"));
var _move_delta_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _move_delta_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (!dashing && movement) {
	var angle = point_direction(0, 0, _move_delta_x, _move_delta_y) - global.z_angle;
	x += lengthdir_x(movement_speed, angle);
	y += lengthdir_y(movement_speed, angle);
}

// Dashing
if (dashing) {
	var angle = direction + 90;
	
	if (movement) {
		angle = point_direction(0, 0, _move_delta_x, _move_delta_y) - global.z_angle;
	}
	
	x += lengthdir_x(dash_speed, angle);
	y += lengthdir_y(dash_speed, angle);
	
	// Effect
	create_dust(5);
} else if (can_dash && keyboard_check_pressed(vk_space)) {
	audio_play_sound(snd_player_dash,40,false);
	dashing = true;
	can_dash = false;
	invincible = true;
	alarm[1] = dash_duration;
}

if (can_dash) {
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

// Low hp effect
if (hp == 1) {
	create_dust(1, spr_effect_dust, c_gray, 0.75);
}

// Invincible effect
image_blend = invincible ? c_gray : c_white;

// Clamp movement
var b = 512;
x = clamp(x,b,room_width-b);
y = clamp(y,b,room_height-b);