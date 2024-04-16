if active {
	baseScale = lerp(baseScale, 1, 0.1);
	
	if moving {
		image_angle = sin(wigglePercent * 2 * pi) * wiggle;
		wigglePercent = (wigglePercent + wiggleRate) % 1;

		if (point_distance(x, y, xTarget, yTarget) <= speed) {
			speed = 0;
			x = xTarget;
			y = yTarget;
			image_angle = 0;
			moving = false;
		}
	} else {
		image_yscale = 1 + sin(stretchPercent * 2 * pi) * stretch;
		stretchPercent = (stretchPercent + stretchRate) % 1
	}
} else {
	baseScale = lerp(baseScale, 0, 0.1);	
}