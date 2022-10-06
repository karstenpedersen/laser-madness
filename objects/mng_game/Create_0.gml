/// @description 

// Randomize
randomize();

global.wave = 0;
global.score = 0;

// Create instances
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_player);

// Tutorial
if (global.setting_is_new) {
	instance_create_layer(room_width / 2, room_height / 2, "Instances", mng_tutorial);
}

global.enemy_list = ds_list_create();
ds_list_add(global.enemy_list, obj_enemy_flyer);
ds_list_add(global.enemy_list, obj_enemy_flyer);

global.completed_tutorial = global.setting_is_new;