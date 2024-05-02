switch state {
	case pongStates.intro:
		if !stateInit {
			objPongPlayerPaddle.canGrab = false;
			with objPongWindow {
				active = true;
				drawScale = 1;
			}
			stateInit = true;
		}
		counter ++;
		if (counter == 60) {
			switchState(tutorial ? pongStates.tutorial1: pongStates.playerGrab)
		}
		break;
	case pongStates.tutorial1:
		if !stateInit {
			objPongPlayerPaddle.canGrab = true;
			objPongWindow.hide();
			objPongIndicator.show(sprPongTutorial1, true);
			stateInit = true;
		}
		with objPongPlayerPaddle {
			if grabbed {
				other.switchState(pongStates.tutorial2);	
			}
		}
		break;
	case pongStates.tutorial2:
		if !stateInit {
			objPongIndicator.show(sprPongTutorial2, true);
			stateInit = true;
		}
		with objPongPlayerPaddle {
			if (abs(y - ystart) > 20) {
				other.switchState(pongStates.tutorial3);
			}
		}
		break;
	case pongStates.tutorial3:
		counter ++;
		if (counter == 50) {
			switchState(pongStates.enemyGrab);
		}
		break;
	case pongStates.playerGrab:
		if !stateInit {
			objPongIndicator.show(sprPongTutorial1, getGameData("round") == 1);
			stateInit = true;
		}
		with objPongPlayerPaddle {
			if grabbed {
				other.switchState(pongStates.enemyGrab);	
			}
		}
		break;
	case pongStates.enemyGrab:
		if !stateInit {
			objPongIndicator.hide();
			objPongEnemyPaddle.switchState(pongEnemyStates.grab);
			stateInit = true;
		}
		break;
}