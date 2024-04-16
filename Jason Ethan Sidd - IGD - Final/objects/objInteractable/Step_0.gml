if active && visible {
	if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
		drawScale = lerp(drawScale, 1.2, 0.2);
		if mouse_check_button_pressed(mb_left) {
			drawScale = 1;
			with objInteractable {
				hide();	
			}
			with objManager {
				addLines(other.lines);
				doNextThing();
			}
		}
	} else {
		drawScale = lerp(drawScale, 1, 0.2);	
	}
} else {
	drawScale = max(drawScale - 0.05, 0);	
}