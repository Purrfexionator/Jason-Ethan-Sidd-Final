if grabbed {
	drawScale = lerp(drawScale, 1.1, 0.1);
	var prevY = y;
	y = clamp(relativeMouseY(), frame.bbox_top + 50, frame.bbox_bottom - 50);
	drawAngle = lerp(drawAngle, (y - prevY) * -0.3, 0.2);
	
	if mouse_check_button_released(mb_left) {
		grabbed = false;
		drawScale = 1.05;
	}
} else {
	if mouseOver() {
		drawScale = lerp(drawScale, 1.1, 0.1);	
		if mouse_check_button_pressed(mb_left) {
			grabbed = true;
			drawScale = 1.2;
		}
	} else {
		drawScale = lerp(drawScale, 1, 0.1);
	}
	drawAngle = lerp(drawAngle, 0, 0.1);
}