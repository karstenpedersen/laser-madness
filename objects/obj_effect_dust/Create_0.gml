
/// @description 

// Inherit the parent event
event_inherited();

var _speed = 2;
speed = irandom(_speed);
direction = irandom(360);

image_index = irandom(6);
image_speed = random_range(0.5, 1);
image_angle = irandom(360);

var _r = 1;
image_xscale = choose(-_r, _r);
image_yscale = choose(-_r, _r);