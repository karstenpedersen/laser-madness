/// @description 

// Handle user input
if (keyboard_check_pressed(vk_escape)) {
	instance_activate_all();
	instance_destroy();
	audio_resume_all();
} else if (keyboard_check_pressed(vk_space)) {
	room_goto(rm_menu);
	audio_resume_all();
}