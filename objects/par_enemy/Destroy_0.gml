/// @description 




// Inherit the parent event
event_inherited();

create_dust(20, spr_effect_dust, c_red);

repeat (irandom_range(3, 5)) {
	var _r = 6;
	var _x = x - irandom_range(-_r, _r);
	var _y = y - irandom_range(-_r, _r);
	
	effect_floor_layer(spr_ship_piece, irandom(sprite_get_number(spr_ship_piece) - 1), _x, _y, 1, 1, irandom(360), make_color_rgb(100, 0, 0), 1);
}

global.score += 10;