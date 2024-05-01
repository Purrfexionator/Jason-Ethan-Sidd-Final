
if active {
	image_alpha = min(image_alpha + 0.1, 1);
} else {
	image_alpha = max(image_alpha - 0.1, 0);	
}

yDraw = relativeY() + sin(wavePercent * 2 * pi) * 2;
wavePercent = (wavePercent + 0.01) % 1;
drawScale = lerp(drawScale, 1, 0.1);
