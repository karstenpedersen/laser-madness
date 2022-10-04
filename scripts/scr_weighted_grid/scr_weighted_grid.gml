
function weighted_grid_setup() {
	return ds_grid_create(2, 0);
}

function weighted_grid_add(_grid, _value, _weight) {
	var _grid_height = ds_grid_height(_grid);
	ds_grid_resize(_grid, 2, _grid_height);
	ds_grid_set(_grid, WEIGHTED_GRID.VALUE, _grid_height, _value);
	ds_grid_set(_grid, WEIGHTED_GRID.WEIGHT, _grid_height, _weight);
}

function weighted_grid_pick_by_weight() {
	
}