/// @description 

global.z_layer = [];
global.world_height = 32;

global.created_layers = false;

// Create initial entities
if (instance_exists(par_entity)) {
	with (par_entity) {
		index = [];
		
		for (var _i = 0; _i < image_number; _i++) {
			index[_i] = layer_sprite_create(global.z_layer[_i], x, y, sprite_index);
		
			layer_sprite_speed(index[_i], 0);
			layer_sprite_index(index[_i], _i);
			layer_sprite_xscale(index[_i], image_xscale);
			layer_sprite_yscale(index[_i], image_yscale);
			layer_sprite_angle(index[_i], image_angle);
		}
	}
}