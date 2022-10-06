/// @description

// Play music
//music_set(snd_music_menu);

menu = new menu_handler([
	new menu_element_text("Laser Madness"),
	new menu_element_button("Play", function(_self) {
		room_goto(rm_game);
	}),
	new menu_element_button("Settings", function(_self) {
		_self.props.set("x", 30);
	}),
	new menu_element_button("Exit", function(_self) {
		game_end();
	}),
])

menu._setup();