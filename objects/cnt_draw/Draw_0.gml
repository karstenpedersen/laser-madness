/// @description 

if (room == rm_game && !instance_exists(par_menu)) {
	var b = 512;
	draw_rectangle(b, b, room_width-b, room_height-b, true);

	if (surface_exists(floor_surface)) {
		draw_surface_ext(floor_surface, floor_surface_x, floor_surface_y, 1, 1, 0, floor_color, floor_alpha);
	}
}

