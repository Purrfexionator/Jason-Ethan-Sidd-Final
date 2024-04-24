minigame = "mg_test";
frame = noone;
propDepth = 0;

function relativeX() {
	return x - frame.bbox_left;
}

function relativeY() {
	return y - frame.bbox_top;	
}

function relativeMouseX() {
	return mouse_x + frame.mouseXOffset;
}

function relativeMouseY() {
	return mouse_y + frame.mouseYOffset;
}

function mouseOver() {
	var xpos = relativeMouseX();
	var ypos = relativeMouseY();
	return instance_position(xpos, ypos, self) != noone;
}

function mousePressed(button) {
	return mouseOver() && mouse_check_button_pressed(button);	
}

function mouseDown(button) {
	return mouseOver() && mouse_check_button(button);
}

function mouseReleased(button) {
	return mouseOver() && mouse_check_button_released(button);
}

function spawnProp(xpos, ypos, prop, propDepth) {
	with frame {
		addProp(xpos, ypos, prop, propDepth);	
	}
}

function endMinigame(victory) {
	with objMinigames {
		active = false;
		delay = 25;
		objManager.addLines(victory ? win : lose);
	}
}

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

onMinigameStart = function() {}