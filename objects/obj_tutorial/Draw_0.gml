/// @description 

if (instance_exists(obj_player)) {
	var _dir = obj_player.image_angle - 90;
	var _len = 64;
	var _x = obj_player.x + lengthdir_x(_len, _dir);
	var _y = obj_player.y + lengthdir_y(_len, _dir);
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_small);
	draw_set_halign(fa_center);
	
	var _message = "";
	
	if (!pressed_move) {
		_message = "Move with WASD";
	} else if (!pressed_rotate) {
		_message = "Rotate with LEFT and RIGHT arrows";
	} else if (!pressed_dash) {
		_message = "Dash with SPACE";
	}
	
	draw_text_ext_transformed(_x, _y, _message, 12, 200, 1, 1, _dir + 90);
}