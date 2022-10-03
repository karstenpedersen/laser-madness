/// @description 

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, 640, 640, false);

draw_set_color(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_middle);
draw_text(640/2,128+32,"PAUSED")
draw_set_font(fnt_title_small);
draw_text(640/2,128+128,"Press escape to resume")
draw_text(640/2,128+128+64,"Press space to quit")