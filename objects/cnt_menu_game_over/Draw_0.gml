/// @description 

draw_set_color(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_middle);
draw_text(640/2,128+32,"You dieded")
draw_text(640/2,128+64+32,"Score: " + string(global.score));
draw_set_font(fnt_title_small);
draw_text(640/2,128+64+128,"Press space to play")
draw_text(640/2,128+64+128+32,"Press escape to quit")