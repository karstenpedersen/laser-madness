/// @description 

var _procent = (weapon.cooldown - alarm[0]) / weapon.cooldown;

draw_set_alpha(1);
draw_set_color(make_color_rgb(20, 20, 20));

if (instance_exists(obj_projectile_player)) {
	draw_set_color(c_red);
}

draw_rectangle(0, 0, 5, 640, false);
draw_rectangle(640 - 5, 0, 640, 640, false);
draw_rectangle(0, 640 - 5, 640, 640, false);
draw_rectangle(0, 0, 640, 5, false);

draw_set_color(make_color_rgb(50, 50, 50));

if (instance_exists(obj_projectile_player)) {
	draw_set_color(c_red);
}

draw_rectangle(0, 0, 5, _procent * 640, false);
draw_rectangle(640 - 5, 640 - _procent * 640, 640, 640, false);
draw_rectangle(0, 640 - 5, _procent * 640, 640, false);
draw_rectangle(640 - _procent * 640, 0, 640, 5, false);