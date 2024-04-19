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
	
	draw_surface_ext(surface, x - width / 2, y - height / 2, boxPercent, boxPercent, 0, c_white, 1);
	draw_rectangle(x - width / 2, y - height / 2, x + width / 2, y + height / 2, true);
	
	caption.update();
	draw_text_ext(x - width / 2, y - height / 2 - 20, caption.currentText, 20, width);
}