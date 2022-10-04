
// Settings
///@func settings_load()
function settings_load() {
	ini_open("settings.ini");
	var _section;
	
	#region Settings
	_section = "GAMEPLAY";
	global.setting_show_splash = ini_read_real(_section, "show_splash", true);
	
	_section = "VIDEO";
	global.setting_fullscreen = ini_read_real(_section, "fullscreen", true);
	global.setting_screenshake = ini_read_real(_section, "screenshake", 1);
	
	_section = "AUDIO";
	global.setting_master_volume = ini_read_real(_section, "volume_master", 0.5);
	global.setting_effect_volume = ini_read_real(_section, "volume_effect", 1);
	global.setting_music_volume  = ini_read_real(_section, "volume_music",  1);
	
	_section = "UTIL";
	global.setting_is_new = ini_read_real(_section, "first_time", true);
	#endregion

	ini_close();
}

///@func settings_save()
function settings_save() {
	ini_open("settings.ini");
	var _section;
	
	#region Settings
	_section = "GAMEPLAY";
	ini_write_real(_section, "show_splash", global.setting_show_splash);
	
	_section = "VIDEO";
	ini_write_real(_section, "fullscreen", global.setting_fullscreen);
	ini_write_real(_section, "screenshake", global.setting_screenshake);
	
	_section = "AUDIO";
	ini_write_real(_section, "volume_master", global.setting_master_volume);
	ini_write_real(_section, "volume_effect", global.setting_effect_volume);
	ini_write_real(_section, "volume_music",  global.setting_music_volume);
	
	_section = "UTIL";
	ini_write_real(_section, "first_time",  global.first_time);
	#endregion
	
	ini_close();
}

///@func settings_delete()
function settings_delete() {
	file_delete("settings.ini");
}


function highscores_load() {
	
}

function highscores_save() {
	
}