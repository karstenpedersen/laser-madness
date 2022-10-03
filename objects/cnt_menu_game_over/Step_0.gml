/// @description 

if (keyboard_check_pressed(vk_space)) {
	room_goto(rm_menu);
} else if (keyboard_check_pressed(vk_escape)) {
	game_end();
}