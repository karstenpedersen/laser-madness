

///@func music_set(soundid, loop)
function music_set(_sound, _loop = true) {
	audio_play_sound(_sound, 50, _loop);
}