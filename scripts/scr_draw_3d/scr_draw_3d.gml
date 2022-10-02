
///@arg x
///@arg y
///@arg z
function depth_3d(argument0, argument1, argument2) {

	var xx = argument0;
	var yy = argument1;
	var zz = argument2;

	/*var dir = -global.camera_angle+90;
	depth = xx*lengthdir_x(1,dir)+yy*lengthdir_y(1,dir)-zz;*/

	var CamForward = -global.camera_angle+90;
	depth = dot_product(x,y, lengthdir_x(1,CamForward ), lengthdir_y(1,CamForward )) - room_width;
}

function draw_sprite_stacked() {
	var h = 1;
	var x_axis = lengthdir_x(h,global.z_angle-90);
	var y_axis = lengthdir_y(h,global.z_angle+90);

	for (var i = z; i < z+image_number; i++) {
		draw_sprite_ext(sprite_index,i-z,x+(i*x_axis),y+(i*y_axis),image_xscale,image_yscale,sprite_angle,c_white,1);
	}
}

function draw_sprite_3d() {
	// Draw 3d rotating sprite
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,-global.z_angle,c_white,image_alpha);
}

///@arg angle
function draw_sprite_stacked_shadow(argument0) {

	var _angle = argument0;
	/*
	var x_axis = lengthdir_x(1,_angle);
	var y_axis = lengthdir_y(1,_angle);
	var i;
	for (i = z; i < z+image_number; i++) {
		draw_sprite_ext(sprite_index,i-z,x+(i*x_axis),y+(i*y_axis),image_xscale,image_yscale,sprite_angle,c_black,1);
	}

/* end draw_sprite_stacked_shadow */
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
