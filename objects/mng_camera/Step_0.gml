/// @description 

// Set target
if instance_exists(obj_player) {
	target = obj_player;
} else {
	target = noone;
}

if (!instance_exists(par_menu)) && (instance_exists(obj_player)) {
	//controller turning camera
	var controller_id = obj_player.controller_id;
	var rhaxis = gamepad_axis_value(controller_id, gp_axisrh);
	var stick_pos_right = point_distance(0 ,0, rhaxis, 0);
		
	// Rotate camera keyboard
	input = keyboard_check(vk_right) - keyboard_check(vk_left);
	if input == 0 && stick_pos_right > obj_player.deadzone {
		input = rhaxis
	}
	global.camera_rotating = keyboard_check(vk_right) + keyboard_check(vk_left);
	global.camera_angle += input * global.camera_rotate_speed;
	
	if (global.camera_angle > 360) {
		global.camera_angle = 0;
	} else if (global.camera_angle < 0) {
		global.camera_angle = 360;
	}
	
	camera_set_view_angle(global.camera, global.camera_angle);

	global.z_angle = global.camera_angle;
}