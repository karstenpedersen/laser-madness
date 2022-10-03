/// @description 

// Inherit the parent event
event_inherited();

audio_play_sound(snd_player_death,40,false);

audio_stop_sound(snd_music);

repeat (5) {
	instance_create_layer(x, y, "Instances", obj_ship_piece);
}

//room_goto(rm_death);