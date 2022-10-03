/// @description 

for (var _i = 0; _i < global.world_height; _i++) {
	var _camDir = -camera_get_view_angle(view_camera[0]) + 90;
	var _ldx = lengthdir_x(_i, _camDir);
	var _ldy = lengthdir_y(_i, _camDir);
	
	layer_x(global.z_layer[_i], _ldx);
	layer_y(global.z_layer[_i], _ldy);
}

// Update sprites
if (instance_exists(par_entity)) {
	with (par_entity) {
		for (var _i = 0; _i < array_length(index); _i++) {
			layer_sprite_speed(index[_i], 0);
			layer_sprite_index(index[_i], _i);
			layer_sprite_xscale(index[_i], image_xscale);
			layer_sprite_yscale(index[_i], image_yscale);
			layer_sprite_angle(index[_i], image_angle);
			layer_sprite_blend(index[_i], image_blend);
			layer_sprite_x(index[_i], x);
			layer_sprite_y(index[_i], y);
		}
	}
}