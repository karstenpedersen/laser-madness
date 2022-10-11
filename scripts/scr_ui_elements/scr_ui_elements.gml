



///@func ui_container_selectable(elements, [props], [events])
function ui_container_selectable(_elements, _props, _events) : ui_container(_elements, _props, _events) constructor  {
	selected_index = 0;
	selected_element = undefined;
	
	select_element = function(_dir) {
		var _element_count = array_length(elements);
		var _selected_index = selected_index;
		
		var _i = 0;
		do {
			selected_index += _dir;
				
			if (selected_index < 0) {
				selected_index = _element_count - 1;
			} else if (selected_index >= _element_count) {
				selected_index = 0;
			}
			
			if (_i > _element_count) {
				selected_index = _selected_index;
				break;
			}
			
			_i++;
		} until (elements[selected_index].selectable);
			
		if (_selected_index != selected_index && !elements[selected_index].selected) {
			var _element = elements[selected_index];
			_element.selected = true;
			_element.events.run("on_select");
				
			if (selected_element) {
				selected_element.selected = false;
				selected_element.events.run("on_unselect");
			}
				
			selected_element = _element;
		}
	}
	
	select_element(1);
}

///@func ui_container(elements, [props], [events])
function ui_container(_elements, _props, _events) : ui_element(_props, _events) constructor  {
	elements = _elements;
}


///@func ui_button(text, on_click, [props], [events])
function ui_button(_text, _on_click, _props, _events) : ui_text(_text, _props, _events) constructor {
	hoverable = true;
	selectable = true;
	
	events.set("on_click", _on_click);
}

///@func ui_text(text, [props], [events])
function ui_text(_text, _props, _events) : ui_element(_props, _events) constructor {
	text = _text;
	
	draw = function() {
		draw_set_halign(props.get("halign"));
		draw_set_valign(props.get("valign"));
		draw_set_font(props.get("font"));
		draw_set_color(hovered || selected ? c_red : props.get("image_blend"));
		draw_text(props.get("x"), props.get("y"), text);
	}
}

///@func ui_element([props], [events])
function ui_element(_props = undefined, _events = undefined) constructor {
	selected = false;
	hovered = false;
	hoverable = false;
	selectable = false;
	
	parent = undefined;
	elements = [];
	
	props = new ui_property_handler(self, new ui_properties(_props));
	events = new ui_event_handler(self, _events);
	
	static _draw = function() {
		draw();
		draw_elements();
	};
	static _update = function() {
		// Update props
		props.update(self);
		
		// Hover
		if (hoverable) {
			var _hovered = hovered;
			hovered = point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y, props.get("bbox_left"), props.get("bbox_top"), props.get("bbox_right"), props.get("bbox_bottom"));
		
			if (_hovered != hovered) {
				if (hovered) {
					events.run("on_hover");
				} else {
					events.run("on_unhover");
				}
			} else if (hovered) {
				events.run("on_hovering");
			}
		}
		
		// On click events
		if (hovered && mouse_check_button_pressed(mb_left)) {
			events.run("on_click");
		}
		
		update();
		update_elements();
	};
	
	draw_elements = function() {
		for (var _i = 0; _i < array_length(elements); _i++) {
			var _element = elements[_i];
			
			_element._draw();
		}
	}
	update_elements = function() {
		for (var _i = 0; _i < array_length(elements); _i++) {
			var _element = elements[_i];
			_element._update();
		}
	}

	draw = function() {};
	update = function() {};
}