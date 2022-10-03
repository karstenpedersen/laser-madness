/// @description 

// Set target
if instance_exists(obj_player) {
	target = obj_player;
} else {
	target = noone;
}

if (!instance_exists(par_menu)) {
	// Rotate camera
	var input = keyboard_check(vk_right) - keyboard_check(vk_left);
	global.camera_rotating = keyboard_check(vk_right) + keyboard_check(vk_left);
	global.camera_angle += input * global.camera_rotate_speed;
	if (global.camera_angle > 360) {
		global.camera_angle = 0;
	} else if (global.camera_angle < 0) {
		global.camera_angle = 360;
	}
	camera_set_view_angle(global.camera, global.camera_angle);

	global.z_angle = global.camera_angle;
} else if (room = rm_menu) {
	x = 0;
	y = 0;
}

// Activate objects
if (!PAUSED) {
	// Deactivate objects
	instance_deactivate_all(true);
	
	// Activate region
	instance_activate_region(x - global.camera_width, y - global.camera_width, global.camera_width * 2, global.camera_width * 2, true);
	
	// Activate objects
	instance_activate_object(par_entity);
}
