///@func ui_title(text, [props], [events])
function ui_title(_text, _props = { font: fnt_title }, _events) : ui_text(_text, _props, _events) constructor {

}

///@func ui_credit(name, title, [props], [events])
function ui_credit(_name, _title, _props = { width_type: UI_WIDTH.MAX }, _events) : ui_element(_props, _events) constructor {
	name = _name;
	title = _title;

	draw = function() {
		draw_set_valign(props.get("valign"));
		draw_set_font(props.get("font"));
		
		draw_set_color(c_gray);
		draw_set_halign(fa_left);
		draw_text(props.get("x"), props.get("y"), title);
		
		draw_set_color(hovered || selected ? c_red : props.get("image_blend"));
		draw_set_halign(fa_right);
		draw_text(props.get("bbox_right"), props.get("y"), name);
	}
}