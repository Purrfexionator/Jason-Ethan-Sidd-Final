if boxPercent > 0.01 {
	var xpos = round(x + xWave * sin(xPercent * 2 * pi));
	xPercent = (xPercent + xRate) % 1;
	var ypos = round(y + yWave * cos(yPercent * 2 * pi));
	yPercent = (yPercent + yRate) % 1;
	
	draw_set_color(boxColor);
	
	var width = boxWidth * boxPercent;
	var height = boxHeight * boxPercent;

	draw_rectangle(xpos - width / 2, ypos - height / 2, xpos + width / 2, ypos + height / 2, true);
	
	caption.update();
	content.update();
	
	draw_text_ext(xpos - width / 2, ypos - height / 2 - 20, caption.currentText, 20, width);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text_ext(xpos, ypos, content.currentText, 20, width - 20);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}