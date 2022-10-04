/// @description 

// Reset z-layers
global.z_layer = [];

// Create layers
for (var _i = 0; _i < global.world_height; _i++) {
	global.z_layer[_i] = layer_create(-_i, "z_layer[" + string(_i) + "]");
}

global.created_layers = true;

// Surface
floor_surface_width = room_width;
floor_surface_height = room_height;

if (surface_exists(floor_surface)) surface_resize(floor_surface, floor_surface_width, floor_surface_height);			     else floor_surface = surface_create(floor_surface_width, floor_surface_height);