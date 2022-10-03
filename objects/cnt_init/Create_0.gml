/// @description 

window_set_cursor(cr_none);

if (!instance_exists(cnt_controller)) instance_create_depth(0, 0, 0, cnt_controller);
if (!instance_exists(cnt_draw)) instance_create_layer(0, 0, "Drawing", cnt_draw);

window_set_fullscreen(true);

room_goto(rm_menu);