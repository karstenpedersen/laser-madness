/// @description 

// Create instances
instance_create_layer(room_width / 2, room_height / 2, "Instances", cnt_camera);
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_player);

global.wave = 0;
global.score = 0;

global.enemy_list = ds_list_create();
ds_list_add(global.enemy_list, obj_enemy_turret);
ds_list_add(global.enemy_list, obj_enemy_flyer);

function s_spawn_enemies() {
	var _enemy_count = global.wave + irandom_range(3, 5);
	
	for (var _i = 0; _i < _enemy_count; _i++) {
		var _len = irandom_range(200, 500);
		var _dir = irandom(360);
		var _x = obj_player.x + lengthdir_x(_len, _dir);
		var _y = obj_player.y + lengthdir_y(_len, _dir);
		
		var _enemy = ds_list_find_value(global.enemy_list, irandom(ds_list_size(global.enemy_list) - 1));
		
		with (instance_create_layer(_x, _y, "Instances", obj_enemy_spawner)) {
			object = _enemy;
		}
	}
}