
///@func menu_handler(_elements, _properties)
function menu_handler(_elements, _properties) : menu_element_container(_elements) constructor {
	menu_index = 0;
	selected_index = 0;
}

///@func menu_element_container(_elements)
function menu_element_container(_elements) : menu_element() constructor  {
	elements = _elements;
}


///@func menu_element_button(x, y, text, click_event)
function menu_element_button(_x, _y, _text, click_event) : menu_element_text(_x, _y, _text) constructor {
	hoverable = true;
	selectable = true;
	
	on_click = click_event;
}

///@func menu_element_text(x, y, text)
function menu_element_text(_x, _y, _text) : menu_element(_x, _y) constructor {
	text = _text;
	
	props = new me_property_handler(new me_text_properties(_x, _y, fnt_small));
	
	draw = function() {
		draw_set_halign(props.get("halign"));
		draw_set_valign(props.get("valign"));
		draw_set_font(props.get("font"));
		draw_set_color(hovered ? c_red : props.get("image_blend"));
		draw_text(props.get("x"), props.get("y"), text);
	}
}

///@func menu_element(x, y)
function menu_element(_x, _y) constructor {
	selected = false;
	hovered = false;
	hoverable = false;
	selectable = false;
	
	elements = [];
	
	props = new me_property_handler(new me_properties(_x, _y));
	events = new me_event_handler();
	
	static _setup = function() {
		setup_elements();
		setup();
	}
	static _draw = function() {
		draw_rectangle(props.get("bbox_left"), props.get("bbox_top"), props.get("bbox_right"), props.get("bbox_bottom"), true);
		draw_text(props.get("x") + 100, props.get("y"), props.get("bbox_left"))
		on_draw(self);
		draw();
		draw_elements();
	};
	static _update = function() {
		// Update props
		props.update(self);
		
		// Hover
		if (hoverable) {
			hovered = point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y, props.get("bbox_left"), props.get("bbox_top"), props.get("bbox_right"), props.get("bbox_bottom"));
		}
		
		if (on_click.start && hovered && mouse_check_button_pressed(mb_left)) {
			on_click.start(self);
		}
		
		on_update(self);
		update();
		update_elements();
	};
	
	static setup_elements = function() {
		for (var _i = 0; _i < array_length(elements); _i++) {
			var _element = elements[_i];
			_element._setup();
		}
	}
	static draw_elements = function() {
		for (var _i = 0; _i < array_length(elements); _i++) {
			var _element = elements[_i];
			
			_element._draw();
		}
	}
	static update_elements = function() {
		for (var _i = 0; _i < array_length(elements); _i++) {
			var _element = elements[_i];
			_element._update();
		}
	}
	
	setup = function() {};
	draw = function() {};
	update = function() {};
	
	on_update = function(_self) {};
	on_draw = function(_self) {};
	
	on_click = new me_event(function() { show_debug_message("Clicked"); });
	on_hover = new me_event(function() { window_set_cursor(cr_handpoint); }, undefined, function() { window_set_cursor(cr_default); });
	
	static set_position = function(_x, _y) {
		props.set(_x);
		props.set(_y);
	}
}

///@func me_event_handler(default_events)
function me_event_handler(_default) constructor {
	events = _default;
	
	get = function(_name) {
		if (variable_struct_exists(events, _name)) {
			return variable_struct_get(events, _name)
		}
		
		return undefined;
	}
}

///@func me_property_handler(default_properties)
function me_property_handler(_default) constructor {
	default_props = _default;	
	props = default_props;
	custom_props = {};
	
	get = function(_name) {
		if (variable_struct_exists(props, _name)) {
			return variable_struct_get(props, _name).get();
		}
		
		return undefined;
	}
	
	set = function(_name, _value) {
		if (variable_struct_exists(custom_props, _name)) {
			variable_struct_set(custom_props, _property_name, new me_property(_value));
		} else if (variable_struct_exists(props, _name)) {
			var _property = variable_struct_get(props, _name);
			_property.set(_value);
		}
		
		_calculate_properties();
	}
	
	update = function(_element) {
		var _property_names = variable_struct_get_names(props);
		
		for (var _i = 0; _i < array_length(_property_names); _i++) {
			var _property_name = _property_names[_i];
			var _property = variable_struct_get(props, _property_name);
			
			// Transition
			show_debug_message(_property_name + " " + string(_property));
			_property.update(_element);
		}
	}
	
	// TODO
	_calculate_properties = function() {
		var _property_names = variable_struct_get_names(custom_props);
		
		for (var _i = 0; _i < array_length(_property_names); _i++) {
			var _property_name = _property_names[_i];
			
			if (variable_struct_exists(custom_props, _property_name)) {
				
			}
		}
	}
}

///@func me_event(start, during, finish)
function me_event(_start = function() {}, _during = function() {}, _finish = function() {}) constructor {
	start = _start;
	during = _during;
	finish = _finish;
}

///@func me_text_properties([x], [y], [font])
function me_text_properties(_x = 0, _y = 0, _font = fnt_small) : me_properties(_x, _y) constructor {
	font = new me_property(_font);
	halign = new me_property(fa_left);
	valign = new me_property(fa_top);
}

///@func me_properties([x], [y])
function me_properties(_x = 0, _y = 0) constructor {
	x = new me_property(_x);
	y = new me_property(_y);
	width = new me_property(100);
	height = new me_property(20);
	bbox_left = new me_property(function(_e) { return _e.props.get("x"); });
	bbox_right = new me_property(function(_e) { return _e.props.get("x") + _e.props.get("width"); });
	bbox_top = new me_property(function(_e) { return _e.props.get("y"); });
	bbox_bottom = new me_property(function(_e) { return _e.props.get("y") + _e.props.get("height"); });
	image_xscale = new me_property(1);
	image_yscale = new me_property(1);
	image_blend = new me_property(c_white);
	image_alpha = new me_property(1);
}

///@func me_property(value)
function me_property(_value) constructor {
	value = 0;
	value_method = undefined;
	has_method = is_method(_value);
	transition = new me_transition();
	
	if (has_method) {
		value_method = _value;
	} else {
		value = _value;
	}
	
	static get = function() {
		return value;
	}
	
	static set = function(_value) {
		has_method = is_method(_value);
		
		if (has_method) {
			value_method = _value;
			return;
		}
		
		value = _value;
	}
	
	static update = function(_element) {
		if (has_method) {
			value = value_method(_element);
			return;
		}
		
		// Transition
		
	}
}

///@func me_transition()
function me_transition() constructor {
	transitioning = false;
	curve = anc_linear;
	duration = 0;
	delay = 0;
	
	timer = 0;
	
	static start = function() {
		timer = -delay;
		transitioning = true;
	}
	
	static stop = function() {
		timer = 0;
		transitioning = false;
	}
	
	static update = function() {
		timer += 1;
		
		if (timer >= duration) {
			stop();
		}
	}
	
	static get = function() {
		return clamp(timer / duration, 0, 1);
	}
}