/// @description 



if (room == rm_game && !instance_exists(par_menu)) {
	draw_set_alpha(0.3);
	draw_set_color(c_white);
	draw_set_font(fnt_score);
	var score_width = string_length(global.score);
	var score_width_max = 7;
	var score_draw = "";
	repeat (score_width_max - score_width) {
		score_draw = string_insert("0", score_draw, string_length(score_draw));
	}
	score_draw = string_insert(global.score, score_draw, string_length(score_draw) + 1);
	draw_text(320, 14, string(score_draw));
}