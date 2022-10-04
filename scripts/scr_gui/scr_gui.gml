
///@func score_to_text(score, length)
function score_to_text(_score = global.score, _score_length = 7) {
	var score_width = string_length(_score);
	var score_draw = "";
	repeat (_score_length - score_width) {
		score_draw = string_insert("0", score_draw, string_length(score_draw));
	}
	
	return string_insert(_score, score_draw, string_length(score_draw) + 1);
}