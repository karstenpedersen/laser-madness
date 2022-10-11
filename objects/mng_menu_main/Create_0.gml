/// @description

// Play music
//music_set(snd_music_menu);

menu_handler = new ui_menu_handler("main", {
	main: new ui_menu([
		new ui_title("Laser Madness"),
		new ui_button("Play", function(_s) {
			room_goto(rm_game);
		}),
		new ui_button("Settings", function(_s) {
			menu_handler.goto("settings");
		}),
		new ui_button("Credits", function(_s) {
			menu_handler.goto("credits");
		}),
		new ui_button("Exit", function(_s) {
			menu_handler.goto("exit");
		}),
	]),
	settings: new ui_menu([
		new ui_title("Settings"),
		new ui_button("Go back", function(_s) {
			menu_handler.go_back();
		}),
	]),
	
	// Credits menu
	credits: new ui_menu([
		new ui_title("Credits"),
		new ui_credit("Karsten F. Pedersen", "Programmer"),
		new ui_credit("Jonas", "Sound Designer"),
		new ui_button("Go back", function(_s) {
			menu_handler.go_back();
		}),
	]),
	
	// Exit menu
	"exit": new ui_menu([
		new ui_text("Exit?"),
		new ui_button("Yes", function(_s) {
			game_end();
		}),
		new ui_button("No", function(_s) {
			menu_handler.go_back();
		}),
	], {x: 320, halign: fa_center})
});