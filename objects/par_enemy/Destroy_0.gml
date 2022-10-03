/// @description 




// Inherit the parent event
event_inherited();

create_dust(10, spr_effect_dust, c_red);

effect_floor_layer(sprite_index, 0, x, y, 1, irandom(360), make_color_rgb(140, 0, 0), 1);

global.score += 10;