/// @description 

// Load data (settings, highscores and ...)
settings_load();
highscores_load();

// Hide cursor
// window_set_cursor(cr_none);

// Create controllers
if (!instance_exists(mng_camera)) instance_create_layer(0, 0, "Managers", mng_camera);
if (!instance_exists(mng_controller)) instance_create_layer(0, 0, "Managers", mng_controller);
if (!instance_exists(mng_renderer)) instance_create_layer(0, 0, "Managers", mng_renderer);
if (!instance_exists(mng_music)) instance_create_layer(0, 0, "Managers", mng_music);

// Setup window
window_set_fullscreen(global.setting_fullscreen);

// Go to menu
room_goto(rm_menu);