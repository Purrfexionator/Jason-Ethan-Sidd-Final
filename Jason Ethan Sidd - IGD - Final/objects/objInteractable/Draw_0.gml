if drawScale > 0.01 {
	var angle = sin(wigglePercent * 2 * pi) * wiggle;
	wigglePercent = (wigglePercent + wiggleRate) % 1;
	var ypos = y + sin(wavePercent * 2 * pi) * wave;
	wavePercent = (wavePercent + waveRate) % 1;

	draw_sprite_ext(sprite_index, image_index, x, ypos, drawScale, drawScale, angle, image_blend, image_alpha);

	
	nameDisplay.update();
	var textPos = ypos - 10 - (sprite_height * drawScale) / 2;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext(x, textPos, nameDisplay.currentText, 20, 50);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}