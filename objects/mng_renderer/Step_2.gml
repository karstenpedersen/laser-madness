/// @description 

// Move z-layers based on camera angle
for (var _i = 0; _i < global.world_height; _i++) {
	var _camDir = -camera_get_view_angle(view_camera[0]) + 90;
	var _ldx = lengthdir_x(_i, _camDir);
	var _ldy = lengthdir_y(_i, _camDir);
	
	layer_x(global.z_layer[_i], _ldx);
	layer_y(global.z_layer[_i], _ldy);
}

// Update sprites
if (instance_exists(par_model)) {
	with (par_model) {
		st_update();
	}
}