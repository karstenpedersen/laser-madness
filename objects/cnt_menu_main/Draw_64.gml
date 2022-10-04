/// @description 

// Draw menu
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_middle);
draw_text(320, 32, "LASER MADNESS");

draw_set_font(fnt_title_small);
draw_text_ext_transformed(640/2,96,"Super Mega Neo Ultimate Climax No Way Back Wars Deluxe Edition", 40, 450, 1, 1, 0);

draw_text(640/2,185+128,"Press space to start")

if (os_browser == browser_not_a_browser) {
	draw_text(640/2,185+128+64,"Press escape to quit")
}