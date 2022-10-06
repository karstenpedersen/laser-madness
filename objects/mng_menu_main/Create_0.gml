/// @description

// Play music
//music_set(snd_music_menu);

var _button = new ui_button("Test", function(_s) {
	show_debug_message("Settings")
}),

variable_struct_set(_button.events, "on_select", function(_s) {
	_s.props.set("x", 30);
});

menu_handler = new ui_menu_handler([
	new ui_menu([
		new ui_text("Laser Madness"),
		new ui_button("Play", function(_s) {
			room_goto(rm_game);
		}),
		new ui_button("Settings", function(_s) {
			show_debug_message("Settings")
		}),
		new ui_button("Credits", function(_s) {
			show_debug_message("Settings")
		}),
		_button,
		new ui_button("Exit", function(_s) {
			game_end();
		}),
	
		new ui_button("Absolute Position", function(_s) {
			_s.props.set("position", UI_POSITION.RELATIVE);
		}, { x: 100, y: 20, position: UI_POSITION.ABSOLUTE }),
	])
]);