minigame = "mg_test";
frame = noone;

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

draw = function(xpos, ypos) {
	draw_sprite_ext(sprite_index, image_index, xpos, ypos, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

onMinigameStart = function() {
}