if grabbed {
	drawScale = lerp(drawScale, 1.1, 0.1);
	var prevY = y;
	y = clamp(relativeMouseY(), frame.bbox_top + 104, frame.bbox_bottom - 104);
	x = clamp(relativeMouseX(), frame.bbox_left + 125, frame.bbox_right - 125);
	
	if mouse_check_button_released(mb_left) {
		grabbed = false;
		drawScale = 1.05;
		sprite_index = sprCerealBox;
	}
} else {
	if ((mouseOver() && canGrab) && !cupTouch) {
		drawScale = lerp(drawScale, 1.1, 0.1);	
		if mouse_check_button_pressed(mb_left) {
			grabbed = true;
			drawScale = 1.2;
			sprite_index = sprCerealBoxGrabbed;
		}
	} else {
		drawScale = lerp(drawScale, 1, 0.1);
	}
	if (cupTouch) {
		objCerealCup.image_speed = 1;
		if (objCerealCup.image_index >= objCerealCup.image_number - 1)
		{ 
			objCerealCup.image_speed = 0;
			timer++;
			if (timer >= wait_time) {
				objCerealManager.switchState(cerealStates.congrats);
				instance_destroy();
				timer = 0;
			}
		}
	}
}

if place_meeting(x+50,y,objCerealCup) {
	cupTouch = true;
	drawAngle = 270;
} else {
	cupTouch = false;
	drawAngle = 0;
}