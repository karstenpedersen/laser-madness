// Old scripts for drawing "3d"

///@func st_destroy()
function st_destroy() {
	for (var _i = 0; _i < array_length(index); _i++) {
		layer_sprite_destroy(index[_i]);
	}
}

///@func st_setup()
function st_setup() {
	index = [];
	
	for (var _i = 0; _i < image_number; _i++) {
		index[_i] = layer_sprite_create(global.z_layer[_i], x, y, sprite_index);
		
		layer_sprite_speed(index[_i], 0);
		layer_sprite_index(index[_i], _i);
		layer_sprite_xscale(index[_i], image_xscale);
		layer_sprite_yscale(index[_i], image_yscale);
		layer_sprite_angle(index[_i], image_angle);
	}
}

///@func st_update()
function st_update() {
	for (var _i = 0; _i < array_length(index); _i++) {
		layer_sprite_speed(index[_i], 0);
		layer_sprite_index(index[_i], _i);
		layer_sprite_xscale(index[_i], image_xscale);
		layer_sprite_yscale(index[_i], image_yscale);
		layer_sprite_angle(index[_i], image_angle);
		layer_sprite_blend(index[_i], image_blend);
		layer_sprite_x(index[_i], x);
		layer_sprite_y(index[_i], y);
	}
}

///@arg x
///@arg y
///@arg z
///@arg sprite
///@arg angle
///@arg distance
function draw_line_stacked(argument0, argument1, argument2, argument3, argument4, argument5) {
	var _x = argument0;
	var _y = argument1;
	var _z = argument2;
	var _sprite = argument3;
	var _angle = argument4;
	var _distance = argument5;

	var x_axis = lengthdir_x(1,global.z_angle-90);
	var y_axis = lengthdir_y(1,global.z_angle+90);
	var i;
	
	for (i = _z; i < _z+sprite_get_number(_sprite); i++) {
		draw_sprite_ext(sprite_index,i-_z,_x+(i*x_axis),_y+(i*y_axis),_distance,1,_angle,c_white,1);
	}
}
