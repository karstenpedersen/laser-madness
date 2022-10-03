/// @description 

if (keyboard_check_pressed(vk_space)) {
	audio_stop_sound(snd_menu_music);
	room_goto(rm_game);
} else if (keyboard_check_pressed(vk_escape)) {
	game_end();
}