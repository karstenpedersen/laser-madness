/// @description 

// Inherit the parent event
event_inherited();

audio_play_sound(snd_player_death,40,false);

audio_stop_sound(snd_music);

repeat (5) {
	instance_create_layer(x, y, "Instances", obj_ship_piece);
}
instance_create_depth(x, y, -999, obj_ship_explosion);

instance_create_layer(0, 0, "Instances", obj_handle_death);