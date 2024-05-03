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
	
	draw_text(xpos - width / 2, ypos - height / 2 - 20, caption.currentText);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(xpos, ypos, content.currentText);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}