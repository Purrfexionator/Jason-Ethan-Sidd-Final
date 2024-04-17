if sprite_index != -1 {
	var ypos = lerp(y + 50, y, activePercent);
	var scale = lerp(0.8, 1, selectedPercent);
	var alpha = lerp(0.5, 1, selectedPercent) * activePercent;
	draw_sprite_ext(sprite_index, image_index, x, ypos, scale, scale, 0, c_white, alpha);
}