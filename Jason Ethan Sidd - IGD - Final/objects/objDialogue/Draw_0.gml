if boxPercent > 0.01 {
	var width = boxWidth * boxPercent;
	var height = boxHeight * boxPercent;

	draw_rectangle(x - width / 2, y - height / 2, x + width / 2, y + height / 2, true);
	
	caption.update();
	speaker.update();
	if (boxPercent >= 0.95 || !active) {
			content.update();
	}
	
	draw_text_ext(x - width / 2, y - height / 2 - 20, caption.currentText, 20, width);
	draw_text_ext(x - width / 2 + 10, y - height / 2 + 10, speaker.currentText, 20, width - 20);
	draw_text_ext(x - width / 2 + 10, y - height / 2 + 50, content.currentText, 20, width - 20);
	
	if (active && content.complete) {
		var xdraw = x - 30 + width / 2;
		var ydraw = y - 30 + height / 2 + arrowWave * sin(arrowPercent * 2 * pi);
		draw_sprite(sprArrow, 0, xdraw, ydraw);
		arrowPercent = (arrowPercent + arrowRate) % 1;
	}
}