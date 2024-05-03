if mouse_check_button_pressed(mb_left) {
	room_goto_next();	
}

if keyboard_check_pressed(vk_f4) {
	window_set_fullscreen(!window_get_fullscreen());	
}