
function enemy_system_setup() {
	global.enemy_normal_grid = weighted_grid_setup();
	global.enemy_boss_grid = weighted_grid_setup();
}

function enemy_system_cleanup() {
	ds_grid_destroy(global.enemy_normal_grid);
	ds_grid_destroy(global.enemy_boss_grid);
}




function enemy_list_pick_random() {
	
}

function enemy_list_pick_by_weight() {
	
}

///@func spawn_enemies_around_player(amount, min_range, max_range)
function spawn_enemies_around_player(_amount, _min_range, _max_range) {
	for (var _i = 0; _i < _amount; _i++) {
		var _len = irandom_range(_min_range, _max_range);
		var _dir = irandom(360);
		var _x = obj_player.x + lengthdir_x(_len, _dir);
		var _y = obj_player.y + lengthdir_y(_len, _dir);
		
		var _enemy = ds_list_find_value(global.enemy_list, irandom(ds_list_size(global.enemy_list) - 1));
		
		with (instance_create_layer(_x, _y, "Instances", obj_enemy_spawner)) {
			object = _enemy;
		}
	}
}