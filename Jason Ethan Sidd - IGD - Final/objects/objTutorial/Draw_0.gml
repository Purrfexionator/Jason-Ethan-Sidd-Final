container.update();

draw_set_halign(fa_center);
draw_text(x, y, container.currentText);
draw_set_halign(fa_left);

if container.complete {
	draw_sprite(sprArrow, 0, x, y + 80 + sin(wavePercent * 2 * pi) * 3);
}

wavePercent = (wavePercent + 0.02) % 1;