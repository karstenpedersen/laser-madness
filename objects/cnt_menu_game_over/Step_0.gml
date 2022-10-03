/// @description 

if (keyboard_check_pressed(vk_space)) {
	audio_stop_sound(snd_death_music);
	room_goto(rm_game);
} else if (keyboard_check_pressed(vk_escape)) {
	audio_stop_sound(snd_death_music);
	room_goto(rm_menu);
}