

///@func ui_event_handler(element, [events])
function ui_event_handler(_element, _events = undefined) constructor {
	events = _events ? _events : {};
	element = _element;
	
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
			variable_struct_get(events, _name)(element);
			
			if (has("_" + _name)) {
				variable_struct_get(events, "_" + _name)(element);
			}
		}
	}
}

///@func ui_property_handler(element, [props])
function ui_property_handler(_element, _props = undefined) constructor {
	default_props = _props;	
	props = default_props;
	custom_props = {};
	element = _element;
	
	get = function(_name) {
		if (variable_struct_exists(props, _name)) {
			return variable_struct_get(props, _name).get();
		}
		
		return undefined;
	}
	
	set = function(_name, _value) {
		if (variable_struct_exists(custom_props, _name)) {
			variable_struct_set(custom_props, _name, new ui_prop(_value));
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

// TODO - FIX THIS

///@func ui_properties(props)
function ui_properties(_props = undefined) constructor {
	x = new ui_prop(0);
	y = new ui_prop(0);
	width = new ui_prop(100);
	height = new ui_prop(20);
	width_type = new ui_prop(UI_FILL.MAX);
	position = new ui_prop(UI_POSITION.RELATIVE);
	bbox_left = new ui_prop(function(_e) { return _e.props.get("x"); });
	bbox_right = new ui_prop(function(_e) { return _e.props.get("x") + _e.props.get("width"); });
	bbox_top = new ui_prop(function(_e) { return _e.props.get("y"); });
	bbox_bottom = new ui_prop(function(_e) { return _e.props.get("y") + _e.props.get("height"); });
	image_xscale = new ui_prop(1);
	image_yscale = new ui_prop(1);
	image_blend = new ui_prop(c_white);
	image_alpha = new ui_prop(1);
	padding = new ui_prop({ top: 0, bottom: 0, left: 0, right: 0 });
	gap = new ui_prop({ x: 0, y: 0 });
	
	font = new ui_prop(fnt_small);
	halign = new ui_prop(fa_left);
	valign = new ui_prop(fa_top);
	
	// Combine props

	// FIX THIS
	if (_props) {
		var _prop_names = variable_struct_get_names(_props)
		for (var _i = 0; _i < array_length(_prop_names); _i++) {
			var _name = _prop_names[_i];
			var _value = variable_struct_get(_props, _name);
		
			if (variable_struct_exists(self, _name)) {
				variable_struct_set(self, _name, new ui_prop(_value));
			}
		}
	}
}

///@func ui_prop(value)
function ui_prop(_value) constructor {
	value = 0;
	value_method = undefined;
	has_method = is_method(_value);
	transition = new ui_transition();
	
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

///@func ui_transition()
function ui_transition() constructor {
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