/// @description 

// Global variables
global.score = 0;
global.first_time = true;

// Hide cursor
if (os_browser == browser_not_a_browser) {
	window_set_cursor(cr_none);
}

// Create controllers
if (!instance_exists(cnt_camera)) instance_create_layer(0, 0, "Drawing", cnt_camera);
if (!instance_exists(cnt_controller)) instance_create_depth(0, 0, 0, cnt_controller);
if (!instance_exists(cnt_draw)) instance_create_layer(0, 0, "Drawing", cnt_draw);

// Setup window
window_set_fullscreen(true);

// Go to menu
room_goto(rm_menu);