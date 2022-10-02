/// @description 

// Create instances
instance_create_layer(room_width / 2, room_height / 2, "Instances", cnt_camera);
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_player);

global.wave = 0;
alarm[0] = 60;