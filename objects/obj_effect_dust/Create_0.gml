
/// @description 

// Inherit the parent event
event_inherited();

var _speed = 2;
velocity = [random_range(-_speed, _speed), random_range(-_speed, _speed)];

image_index = irandom(6);
image_speed = random_range(0.5, 1);
image_angle = irandom(360);

var _r = 4;
image_xscale = choose(-_r, _r);
image_yscale = choose(-_r, _r);