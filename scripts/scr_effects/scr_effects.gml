
///@func effect_floor_layer(sprite, index, x, y, scale, yscale, angle, color, alpha
function effect_floor_layer(_sprite, _subimg, _x, _y, _xscale, _yscale, _angle, _color, _alpha) {
	with (cnt_draw) {
		if (surface_exists(floor_surface)) {
			_color = merge_color(_color, c_dkgray, 0.125);
			surface_set_target(floor_surface);
			draw_sprite_ext(_sprite, _subimg, _x,_y, _xscale, _yscale, _angle, _color, _alpha);
			surface_reset_target();
		}
	}
}

function create_dust(_amount, _sprite = spr_effect_dust, _color = c_white) {
	repeat (_amount) {
		with (instance_create_layer(x, y, global.z_layer[irandom(array_length(global.z_layer) - 1)], obj_effect_dust)) {
			sprite_index = _sprite;
			image_blend = _color;
		}
	}
}