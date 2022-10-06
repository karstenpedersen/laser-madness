/// @description 

// Pausing
globalvar CAN_PAUSE, PAUSED;
CAN_PAUSE = true;
PAUSED = false;

//tracking mouse pos
globalvar MOUSE_GUI_X, MOUSE_GUI_Y;
MOUSE_GUI_X = device_mouse_x_to_gui(0);
MOUSE_GUI_Y = device_mouse_y_to_gui(0);