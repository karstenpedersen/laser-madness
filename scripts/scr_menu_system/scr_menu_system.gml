
///@func menu_handler(elements, properties)
function menu_handler(_elements, _properties) : menu_element_container(_elements) constructor {
	menu_index = 0;
	selected_index = 0;
}

///@func menu_element_container(elements)
function menu_element_container(_elements) : menu_element() constructor  {
	elements = _elements;
}


///@func menu_element_button(text, on_click, [props])
function menu_element_button(_text, _on_click, _props = undefined) : menu_element_text(_props) constructor {
	hoverable = true;
	selectable = true;
	
	events.set("on_click", _on_click);
}

///@func menu_element_text(text, [props])
function menu_element_text(_text, _props = undefined) : menu_element(_props) constructor {
	text = _text;
	
	props = new me_property_handler(new me_text_properties(_props));
	
	draw = function() {
		draw_set_halign(props.get("halign"));
		draw_set_valign(props.get("valign"));
		draw_set_font(props.get("font"));
		draw_set_color(hovered ? c_red : props.get("image_blend"));
		draw_text(props.get("x"), props.get("y"), text);
	}
}

///@func menu_element([props])
function menu_element(_props = undefined) constructor {
	selected = false;
	hovered = false;
	hoverable = false;
	selectable = false;
	
	elements = [];
	
	props = new me_property_handler(new me_properties(_props));
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
		
		// On click events
		if (events.has("on_click") && hovered && mouse_check_button_pressed(mb_left)) {
			events.run("on_click");
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
	
	set = function(_name, _value) {
		variable_struct_set(events, _name, _value);
	}
	
	has = function(_name) {
		return variable_struct_exists(events, _name);
	}
	
	run = function(_name) {
		if (has(_name)) {
			variable_struct_get(events, _name)();
		}
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

///@func me_text_properties([props])
function me_text_properties(_props = undefined) : me_properties(_props) constructor {
	font = new me_property(fnt_small);
	halign = new me_property(fa_left);
	valign = new me_property(fa_top);
}

// TODO - FIX THIS

///@func me_properties(props)
function me_properties(_props) constructor {
	x = new me_property(0);
	y = new me_property(0);
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