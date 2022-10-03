/// @description 


var _current_enemy_count = instance_number(par_enemy) + instance_number(obj_enemy_spawner);

if (_current_enemy_count <= global.wave) {
	s_spawn_enemies();
	global.wave++;
	
	if (global.wave == 2) {
		ds_list_add(global.enemy_list, obj_enemy_turret);
	} else if (global.wave == 5) {
		ds_list_add(global.enemy_list, obj_enemy_attacker);
	} else if (global.wave == 8) {
		ds_list_add(global.enemy_list, obj_enemy_ship);
	}
}

