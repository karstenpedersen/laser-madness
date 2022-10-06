/// @description 

// Inherit the parent event
event_inherited();

// Stats
hp = 3;
dash_speed = 12;
movement_speed = 2;
invincible_duration = 30;
dash_duration = 15;
weapon = new weapon_player();

// State
dashing = false;
movement = false;
can_dash = true;

alarm[0] = weapon.cooldown;

collision_list = ds_list_create();

//id of active controller and deadzone
controller_id = 0;
deadzone = 0.2;
move_direction = 0;