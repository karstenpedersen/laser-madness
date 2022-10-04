/// @description 

// Inherit the parent event
event_inherited();

// Handle death
instance_create_layer(0, 0, "Instances", obj_handle_death);

// Effects
repeat (5) {
	instance_create_layer(x, y, "Instances", obj_ship_piece);
}
instance_create_depth(x, y, -999, obj_ship_explosion);
