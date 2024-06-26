if place_meeting(x, y, objPongEnemyHand) {
	drawScale = lerp(drawScale, 1.1, 0.1);
}

switch state {
	case pongEnemyStates.grab:
		with objPongEnemyHand {
			x = lerp(x, other.x + 16, 0.05);
		}
		counter ++;
		if (counter == 50) {
			drawScale = 1.2;
			with objPongEnemyHand {
				drawScale = 1.2;
				image_index = 1;
			}
			spawnProp(x - 40, y, propDepth + 1, objPongBall);
		}
		if (counter == 70) {
			switchState(pongEnemyStates.serve)	
		}
		break;
	case pongEnemyStates.serve:
		if !stateInit {
			catchesLeft = numCatches;
			yTarget = irandom_range(frame.bbox_top + 104, frame.bbox_bottom - 164);
			stateInit = true;
		}
		if (y == yTarget) {
			counter ++;
			if (counter == 20) {
				x -= 20;
				with objPongBall {
					x -= 20;
					launch(other.ballSpeed, -1, choose(1, -1));
				}
				switchState(pongEnemyStates.wait);
			}
		}
		break;
	case pongEnemyStates.catchBall:
		if (x - objPongBall.x < 200) {
			if (catchesLeft > 0) {
				with objPongBall {
					var testX = bbox_right;
					var testY = y;
					var testYspd = yspd;
					while (testX < other.bbox_left + 5) {
						testX += xspd;
						if place_meeting(x, testY, [objPongBorder, objPongTaskbar]) {
								testYspd *= -1;
						}
						testY += testYspd;
					}
					other.yTarget = clamp(testY, frame.bbox_top + 104, frame.bbox_bottom - 164)
				}
				catchesLeft --;
				show_debug_message(catchesLeft);
			} else {
				yTarget = irandom_range(frame.bbox_top + 104, frame.bbox_bottom - 164);
			}
			switchState(pongEnemyStates.wait);
		}
		break;
}

x = lerp(x, xstart, 0.15);
if (state == pongEnemyStates.serve || state == pongEnemyStates.wait) {
	objPongEnemyHand.x = x + 16;
}

var prevY = y;
if (y != yTarget) {
	if (y > yTarget) {
		y = max(y - ySpeed, yTarget);	
	} else {
		y = min(y + ySpeed, yTarget);	
	}
	objPongEnemyHand.y = y;
	if (state == pongEnemyStates.serve) {
		objPongBall.y = y;	
	}
}
drawAngle = lerp(drawAngle, (y - prevY) * -0.3, 0.2);