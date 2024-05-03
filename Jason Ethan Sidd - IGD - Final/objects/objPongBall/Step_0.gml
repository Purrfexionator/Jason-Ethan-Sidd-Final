if active {
	drawScale = lerp(drawScale, 1, 0.2);
} else {
	drawScale = max(drawScale - 0.1, 0);
	if (drawScale == 0) {
		instance_destroy();
	}
}

if moving {
	drawAngle += 2;
	
	if (place_meeting(x + xspd, y, objPongPlayerPaddle) && sign(xspd) = -1) {
		if abs(objPongPlayerPaddle.bbox_right - 5 < bbox_left) {
			objPongPlayerPaddle.drawScale = 1.2;
			objPongEnemyPaddle.switchState(pongEnemyStates.catchBall);
			launch(objPongEnemyPaddle.ballSpeed, 1, sign(yspd));
			drawScale = 1.1;
		}
	}
	if (place_meeting(x + xspd, y, objPongEnemyPaddle) && sign(xspd) = 1) {
		if (objPongEnemyPaddle.bbox_left + 5 > bbox_right) {
			objPongEnemyPaddle.drawScale = 1.2;
			launch(objPongEnemyPaddle.ballSpeed, -1, sign(yspd));
			drawScale = 1.1;
		}
	}
	if place_meeting(x + xspd, y, objPongBorder) {
		var scoreSide = sign(xspd);
		xspd = 0;
		yspd = 0;
		active = false;
		moving = false;
		objPongEnemyPaddle.switchState(pongEnemyStates.idle);
		
		if (scoreSide == 1) {
			objPongManager.switchState(pongStates.playerScore);
		} else {
			objPongManager.switchState(pongStates.enemyScore);
		}
	}
	x += xspd;
	
	if place_meeting(x, y + yspd, [objPongBorder, objPongTaskbar]) {
		yspd *= -1;
		drawScale = 1.1;
	}
	y += yspd;
	
}