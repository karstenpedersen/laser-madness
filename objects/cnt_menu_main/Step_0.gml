/// @description 

// Handle user input
if (keyboard_check_pressed(vk_space)) {
	audio_stop_sound(snd_menu_music);
	room_goto(rm_game);
} else if (keyboard_check_pressed(vk_escape) && os_browser == browser_not_a_browser) {
	game_end();
}