if boxPercent > 0.01 {
	if !surface_exists(surface) {
		surface = surface_create(boxWidth, boxHeight);
	}
	
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	currentFrame.drawMinigame();
	surface_reset_target();
	
	var width = boxWidth * boxPercent;
	var height = boxHeight * boxPercent;
	
	var xPos = x - width / 2 + sin(random(2 * pi)) * boxShake;
	var yPos = y - height / 2 + sin(random(2 * pi)) * boxShake;
	boxShake = max(boxShake - boxShakeDeccel, 0);
	
	draw_surface_ext(surface, xPos, yPos, boxPercent, boxPercent, 0, c_white, 1);
	draw_rectangle(xPos, yPos, xPos + width, yPos + height, true);
	
	caption.update();
	draw_text(xPos, yPos - 20, caption.currentText);
}