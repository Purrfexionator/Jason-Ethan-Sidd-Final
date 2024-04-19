if boxPercent > 0.01 {
	var width = boxWidth * boxPercent;
	var height = boxHeight * boxPercent;

	draw_rectangle(x - width / 2, y - height / 2, x + width / 2, y + height / 2, true);
	
	caption.update();
	draw_text_ext(x - width / 2, y - height / 2 - 20, caption.currentText, 20, width);
}