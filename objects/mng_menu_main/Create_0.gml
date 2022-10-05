/// @description

// Play music
//music_set(snd_music_menu);

menu = new menu_handler([
	new menu_element_text(16, 16, "Laser Madness"),
	new menu_element_button(16, 32, "Play", new me_event(function(_self) {
		room_goto(rm_game);
	})),
	new menu_element_button(16, 48, "Settings", new me_event(function(_self) {
		_self.props.set("x", 30);
		show_debug_message("Clicked")
	})),
	new menu_element_button(16, 64, "Exit", new me_event(function(_self) {
		game_end();
	})),
])

menu._setup();