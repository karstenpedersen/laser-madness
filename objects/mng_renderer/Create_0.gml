/// @description 

global.z_layer = [];
global.world_height = 32;

global.created_layers = false;

// Setup initial entities
if (instance_exists(par_model)) {
	with (par_model) {
		st_setup();
	}
}

// Floor surface
floor_surface_x = 0;
floor_surface_y = 0;
floor_surface_width = room_width;
floor_surface_height = room_height;
floor_color = c_ltgray;
floor_alpha = 1;
floor_surface = surface_create(floor_surface_width, floor_surface_height);