drawScale = lerp(drawScale, 1, 0.2);

if moving {
	drawAngle += 2;
	
	if (place_meeting(x + xspd, y, objPongPlayerPaddle) && sign(xspd) = -1) {
		if abs(objPongPlayerPaddle.bbox_right - 5 < bbox_left) {
			objPongPlayerPaddle.drawScale = 1.2;
			objPongEnemyPaddle.switchState(pongEnemyStates.catchBall);
			xspd *= -1;
			drawScale = 1.1;
		}
	}
	if (place_meeting(x + xspd, y, objPongEnemyPaddle) && sign(xspd) = 1) {
		if (objPongEnemyPaddle.bbox_left + 5 > bbox_right) {
			objPongEnemyPaddle.drawScale = 1.2;
			xspd *= -1;
			drawScale = 1.1;
		}
	}
	if place_meeting(x + xspd, y, objPongBorder) {
		xspd = 0;
		yspd = 0;
		moving = false;
	}
	x += xspd;
	
	if place_meeting(x, y + yspd, [objPongBorder, objPongTaskbar]) {
		yspd *= -1;
		drawScale = 1.1;
	}
	y += yspd;
	
}