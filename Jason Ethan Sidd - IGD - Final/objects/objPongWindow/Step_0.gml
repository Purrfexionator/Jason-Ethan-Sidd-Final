if active {
	drawScale = lerp(drawScale, 1, 0.1);
} else {
	drawScale = max(drawScale - 0.1, 0);
}