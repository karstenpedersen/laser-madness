/// @description 


// Handle rooms
switch (room) {
	case rm_menu:
		break;
	
	case rm_game:
		// Pause game
		if (!instance_exists(par_menu) && keyboard_check_pressed(vk_escape) && !instance_exists(obj_handle_death)) {
			instance_create_layer(0, 0, "Managers", mng_menu_pause);
		}
		break;
}