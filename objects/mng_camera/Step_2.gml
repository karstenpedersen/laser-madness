/// @description 

// Follow target
if instance_exists(target) {
	var _offset = global.camera_height / 6;
	x = target.x - lengthdir_x(_offset, -global.z_angle - 90);
	y = target.y - lengthdir_y(_offset, -global.z_angle - 90);
}

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

// Camera shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

// Update camera position
camera_set_view_pos(global.camera,x-view_w_half,y-view_h_half);