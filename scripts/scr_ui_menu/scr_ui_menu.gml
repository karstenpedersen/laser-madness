///@func ui_menu_handler(default_name, menus, [props], [events])
function ui_menu_handler(_default_menu_name, _menus, _props, _events) : ui_container(_menus, _props, _events) constructor {
	default_menu_name = _default_menu_name;
	current_menu_name = default_menu_name;
	menus = _menus;
	selected_element = variable_struct_get(menus, current_menu_name);
	navigation_history = [];
	
	goto = function(_name, _save = true) {
		if (current_menu_name != _name) {
			if (_save) {
				array_push(navigation_history, current_menu_name);
			}
			
			current_menu_name = _name;
			selected_element =  variable_struct_get(menus, current_menu_name);
		}
	}
	
	go_back = function() {
		if (array_length(navigation_history) > 0) {
			goto(array_pop(navigation_history), false);
		} else {
			goto(default_menu, false);
		}
	}
	
	update_elements = function() {
		if (selected_element) {
			selected_element._update();
		}
	}
	draw_elements = function() {
		if (selected_element) {
			selected_element._draw();
		}
	}
	
	goto(default_menu_name);
}

///@func ui_menu(elements, [props], [events])
function ui_menu(_elements, _props = { width: 640, gap: { x: 0, y: 6 } }, _events) : ui_container_selectable(_elements, _props, _events) constructor {
	update = function() {
		var _dir = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) - (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		
		if (_dir != 0) {
			select_element(_dir);
		}
		
		if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
			if (selected_element) {
				selected_element.events.run("on_click");
			}
		}
	}
	
	update_elements = function() {
		var _y = props.get("y");
		
		for (var _i = 0; _i < array_length(elements); _i++) {
			var _element = elements[_i];
			
			if (_element.props.get("position") == UI_POSITION.RELATIVE) {
				_element.props.set("y", _y);
				_element.props.set("x", props.get("x"));
				_y += _element.props.get("height") + props.get("gap").y;
			}
			
			if (_element.props.get("width_type") == UI_WIDTH.MAX) {
				_element.props.set("width", props.get("width"));
			}
			
			_element._update();
		}
	}
}