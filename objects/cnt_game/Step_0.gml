/// @description 


var _current_enemy_count = instance_number(par_enemy) + instance_number(obj_enemy_spawner);

if (_current_enemy_count <= global.wave) {
	s_spawn_enemies();
	global.wave++;
}