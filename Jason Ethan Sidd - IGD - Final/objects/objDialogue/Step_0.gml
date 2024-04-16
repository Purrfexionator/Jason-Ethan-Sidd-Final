if active {
	boxPercent = lerp(boxPercent, 1, 0.1);	
	
	if (mouse_check_button_pressed(mb_left) && boxPercent >= 0.95) {
		if !content.complete {
			content.reveal();
		}  else {
			objManager.doNextThing();
		}
	}
} else {
	boxPercent = max(boxPercent - 0.05, 0);
}