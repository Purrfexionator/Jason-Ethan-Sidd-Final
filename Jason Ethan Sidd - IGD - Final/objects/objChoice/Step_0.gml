if active {
	if point_in_rectangle(mouse_x, mouse_y, x - boxWidth / 2, y - boxHeight / 2, x + boxWidth / 2, y + boxHeight / 2) {
		boxPercent = lerp(boxPercent, 1.1, 0.1);
		boxColor = c_white;
		if mouse_check_button_pressed(mb_left) {
			boxPercent = 1;
			with objChoice {
				hide();	
			}
			with objChoiceSpawner {
				active = false;
				delay = 20;
			}
			if (lines != -1) {
				objManager.addLines(lines);
			}
		}
	} else {
		boxPercent = lerp(boxPercent, 1, 0.1);	 
		boxColor = c_gray;
	}
} else {
	boxPercent = max(boxPercent - 0.05, 0);
}