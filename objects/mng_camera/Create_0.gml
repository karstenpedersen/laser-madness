/// @description 

// Camera
global.camera = view_camera[0];
global.camera_width = camera_get_view_width(global.camera);
global.camera_height = camera_get_view_height(global.camera);
view_w_half = global.camera_width / 2;
view_h_half = global.camera_height / 2;
global.camera_rotating = false; 
global.camera_angle = 0;
global.camera_rotate_speed = 2;
global.z_angle = global.camera_angle;

// Target
target = noone;

// Shake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 0;