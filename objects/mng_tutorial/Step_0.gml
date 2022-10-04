/// @description 



if (keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D"))) {
	pressed_move = true;
}

if (keyboard_check(vk_left) || keyboard_check(vk_right)) {
	pressed_rotate = true;
}

if (keyboard_check_pressed(vk_space)) {
	pressed_dash = true;
}

if (pressed_move && pressed_rotate && pressed_dash) {
	instance_destroy();
	global.completed_tutorial = true;
}