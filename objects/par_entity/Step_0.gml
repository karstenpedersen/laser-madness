/// @description 

if (!created_sprite && global.created_layers) {
	if (instance_exists(cnt_draw)) {
		for (var _i = 0; _i < image_number; _i++) {
			index[_i] = layer_sprite_create(global.z_layer[_i], x, y, sprite_index);
		
			layer_sprite_speed(index[_i], 0);
			layer_sprite_index(index[_i], _i);
			layer_sprite_xscale(index[_i], image_xscale);
			layer_sprite_yscale(index[_i], image_yscale);
			layer_sprite_angle(index[_i], image_angle);
		}
	}

	created_sprite = true;
}

