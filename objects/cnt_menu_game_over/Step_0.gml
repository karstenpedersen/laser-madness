/// @description 

if (keyboard_check_pressed(vk_space)) {
	room_goto(rm_game);
} else if (keyboard_check_pressed(vk_escape)) {
	room_goto(rm_menu);
}