/// @description 

global.z_layer = [];

// Create layers
for (var _i = 0; _i < global.world_height; _i++) {
	global.z_layer[_i] = layer_create(-_i, "z_layer[" + string(_i) + "]");
}

global.created_layers = true;